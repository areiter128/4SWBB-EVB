/*
 * File:   pwr_control.c
 * Author: M91406
 *
 * Created on July 9, 2019, 1:10 PM
 */


#include <xc.h>
#include <stdint.h>
#include <stdbool.h>

#include "pwr_control_4swbb.h"


// Define common data structure for 4-SW BB converter
volatile POWER_CONTROLLER_4SWBB_t c4swbb;


volatile uint16_t pwr_control_4swbb_init(void) {
    
    init_sepic_trig_pwm();   // Set up auxiliary PWM for 4SWBB converter
    init_sepic_pwm();        // Set up 4SWBB converter PWM
    acmp_c4swbb_init();       // Set up 4SWBB converter peak current comparator/DAC
    adc_vout_init();        // Set up 4SWBB converter ADC (voltage feedback only)
    adc_vref_ext_init();          // Set up ADC for sampling reference provided by external voltage divider        
    
    c4swbb.soft_start.counter = 0;                             // Reset Soft-Start Counter
    c4swbb.soft_start.pwr_on_delay = C4SWBB_POWER_ON_DELAY;     // Soft-Start Power-On Delay = 500 ms
    c4swbb.soft_start.ramp_period = C4SWBB_RAMP_PERIOD;         // Soft-Start Ramp Period = 50 ms
    c4swbb.soft_start.pwr_good_delay = C4SWBB_POWER_GOOD_DELAY; // Soft-Start Power Good Delay = 200 ms
    c4swbb.soft_start.reference = C4SWBB_V_OUT_REF;             // Soft-Start Target Reference = 12V
    c4swbb.soft_start.ramp_ref_increment = C4SWBB_REF_STEP;     // Soft-Start Single Step Increment of Reference
    
    c4swbb_vloop_Init();
    
    c4swbb_vloop.ADCTriggerOffset = VOUT_ADCTRIG;
    c4swbb_vloop.ptrADCTriggerRegister = &C4SWBB_VOUT_ADCTRIG;
    c4swbb_vloop.InputOffset = C4SWBB_VOUT_FEEDBACK_OFFSET;
    c4swbb_vloop.ptrControlReference = &c4swbb.data.v_ref;
    c4swbb_vloop.ptrSource = &C4SWBB_VOUT_ADCBUF;
    c4swbb_vloop.ptrTarget = &C4SWBB_DAC_VREF_REGISTER;
    c4swbb_vloop.MaxOutput = DAC_MAX;
    c4swbb_vloop.MinOutput = DAC_MIN;
    c4swbb_vloop.status.flag.enable = 0;
    
    c4swbb.data.v_ref    = 0; // Reset SEPIC reference value (will be set via external potentiometer)
    
    return(1);
}

volatile uint16_t pwr_control_4swbb_start(void) {

    // Run enable-sequence of all peripherals used by this power controller
    adc_module_start();               // Start ADC Module
    acmp_c4swbb_start();        // Start analog comparator/DAC module
    launch_sepic_pwm();         // Start PWM
    
    c4swbb_vloop_Reset(&c4swbb_vloop);    // Reset control loop histories
    
    return(1);
}

volatile uint16_t pwr_control_4swbb_exec(void) {
        
    switch (c4swbb.soft_start.phase) {
        
        /*!SEPIC_SS_INIT
         * When SEPIC converter is in initialization mode, the basic 
         * peripherals needed for the operation of the power converter
         * will be set up. This step is only executed once. */
        case C4SWBB_SS_INIT: // basic PWM, ADC, CMP, DAC configuration
            
            pwr_control_4swbb_init();    // Initialize all peripherals and data structures of the controller
            
            c4swbb.status.flags.op_status = C4SWBB_STAT_OFF; // Set SEPIC status to OFF
            c4swbb.soft_start.phase = C4SWBB_SS_LAUNCH_PER;

        break;

        /*!SEPIC_SS_LAUNCH_PER
         * Once all required peripherals have been initialized, the peripheral blocks and
         * control related software modules are enabled in a dedicated sequence. The PWM 
         * outputs and control loop execution, however, are still disabled and the power
         * supply will not start up yet. This step is only executed once and will complete by 
         * switching into STANDBY  */
        case C4SWBB_SS_LAUNCH_PER: // Enabling PWM, ADC, CMP, DAC 
            
            pwr_control_4swbb_start(); 
            
            c4swbb.status.flags.op_status = C4SWBB_STAT_OFF; // Set SEPIC status to OFF
            c4swbb.soft_start.phase = C4SWBB_SS_STANDBY;
            
        break;
        
        /*!SEPIC_SS_STANDBY
         * This state is entered once all required peripherals have been launched and the 
         * power supply is waiting to be powered up. This is also the standard fall-back 
         * state after a fault/restart condition.
         * To get the power supply to start, all faults status bits need to be cleared,
         * the ADC has to run and produce data, the power controller has to be enabled 
         * and the status bit "c4swbb.status.flags.GO" has to be set.
         * 
         * Please note:
         * The data structure c4swbb.status.flags also offers a setting called auto_start.
         * When this bit is set, the 'enable' and 'GO' bits are set automatically and only
         * the 'adc_active' and 'fault_active' bits are checked.
        */
        case C4SWBB_SS_STANDBY: // Enabling PWM, ADC, CMP, DAC 

            c4swbb.status.flags.op_status = C4SWBB_STAT_STANDBY;  // Set SEPIC status to STANDBY
            
            // Force PWM output and controller to OFF state
            PG1IOCONLbits.OVRENH = 1;           // Disable PWMxH output
            c4swbb_vloop.status.flag.enable = 0; // Disable the control loop
            c4swbb.status.flags.pwm_active = false;   // Clear PWM_ACTIVE flag bit

            // wait for fault to be cleared, adc to run and the GO bit to be set
            if( (c4swbb.status.flags.enabled == 1) && 
                (c4swbb.status.flags.adc_active) &&
                (!c4swbb.status.flags.fault_active) && 
                (c4swbb.status.flags.GO) )
            {
                c4swbb.soft_start.counter = 0;                   // Reset soft-start counter
                c4swbb.soft_start.phase = C4SWBB_SS_PWR_ON_DELAY; // Switch to Power On Delay mode
            }
            break;

        /*!SEPIC_SS_PWR_ON_DELAY
         * In this step the soft-start procedure is counting up call intervals until
         * the defined power-on delay period has expired. PWM and control loop are disabled.
         * At the end of this phase, the state automatically switches to RAMP_UP mode */     
        case C4SWBB_SS_PWR_ON_DELAY:  

            c4swbb.status.flags.op_status = C4SWBB_STAT_START; // Set SEPIC status to START-UP
            
            if(c4swbb.soft_start.counter++ > c4swbb.soft_start.pwr_on_delay)
            {
                c4swbb.soft_start.reference = 0;  // Reset soft-start reference to minimum
                c4swbb_vloop.ptrControlReference = &c4swbb.soft_start.reference; // Hijack controller reference

                c4swbb.soft_start.counter = 0;                   // Reset soft-start counter
                c4swbb.soft_start.phase   = C4SWBB_SS_RAMP_UP;    // Switch to ramp-up mode
            }
            break;    
                 
        /*!SEPIC_SS_RAMP_UP
         * During ramp up, the PWM and control loop are forced ON while the control reference is 
         * incremented. Once the 'private' reference of the soft-start data structure equals the
         * reference level set in c4swbb.data.v_ref, the ramp-up period ends and the state machine 
         * automatically switches to POWER GOOD DELAY mode */     
        case C4SWBB_SS_RAMP_UP: // Increasing reference by 4 every scheduler cycle
            
            c4swbb.status.flags.op_status = C4SWBB_STAT_START; // Set SEPIC status to START-UP

            // Force PWM output and controller to be active 
            PG1IOCONLbits.OVRENH = 0;           // User override disabled for PWMxH Pin =< PWM signal output starts
            c4swbb_vloop.status.flag.enable = 1; // Start the control loop 

            c4swbb.soft_start.reference += 4;  // increment reference
            
            // check if ramp is complete
            if (c4swbb.soft_start.reference >= c4swbb.data.v_ref)
            {
                c4swbb.soft_start.counter = 0;                       // Reset soft-start counter
                c4swbb.soft_start.phase   = C4SWBB_SS_PWR_GOOD_DELAY; // switch to Power Good Delay mode
            }
            break; 
            
        /*!SEPIC_SS_PWR_GOOD_DELAY
         * POWER GOOD DELAY is just like POWER ON DELAY a state in which the soft-start counter
         * is counting call intervals until the user defined period has expired. Then the state 
         * machine automatically switches to COMPLETE mode */     
        case C4SWBB_SS_PWR_GOOD_DELAY:
            
            c4swbb.status.flags.op_status = C4SWBB_STAT_START; // Set SEPIC status to START-UP
            
            if(c4swbb.soft_start.counter++ > c4swbb.soft_start.pwr_good_delay)
            {
                c4swbb.soft_start.counter = 0;                 // Reset soft-start counter
                c4swbb.soft_start.phase   = C4SWBB_SS_COMPLETE; // switch to SOFT-START COMPLETE mode
            }
            break;
                
        /*!SEPIC_SS_COMPLETE
         * The COMPLETE phase is the default state of the power controller. Once entered, only a FAULT
         * condition or external modifications of the soft-start phase can trigger a change of state. */     
        case C4SWBB_SS_COMPLETE: // Soft start is complete, system is running, output voltage reference is taken from external potentiometer
            
            c4swbb.status.flags.op_status = C4SWBB_STAT_ON; // Set SEPIC status to ON mode
            c4swbb_vloop.ptrControlReference = &c4swbb.data.v_ref; // hand reference control back
            break;

        /*!SEPIC_SS_FAULT or undefined state
         * If any controller state is set, different from the previous ones (e.g. FAULT),
         * the power controller sets the FAULT flag bit, enforces detection of the ADC activity 
         * by clearing the adc_active bit and switches the state machine into STANDBY, from
         * which the power controller may recover as soon as all startup conditions are met again. */
        default: // If something is going wrong, reset PWR controller to STANDBY

            c4swbb.status.flags.op_status = C4SWBB_STAT_FAULT; // Set SEPIC status to FAULT mode
            c4swbb.status.flags.fault_active = true;          // Set FAULT flag bit
            c4swbb.status.flags.adc_active = false;           // Clear ADC_READY flag bit

            c4swbb.soft_start.phase = C4SWBB_SS_STANDBY;
            break;
            
    }
        
    /*!Power Converter Auto-Start Function
     * When the control bit c4swbb.status.flags.auto_start is set, the status bits 'enabled' 
     * and 'GO' are automatically set and continuously enforced to ensure the power supply
     * will enter RAMP UP from STANDBY without the need for user code intervention. */
    // 
    if (c4swbb.status.flags.auto_start == true) {
        c4swbb.status.flags.enabled = true;  // Auto-Enable power converter
        c4swbb.status.flags.GO = true;       // Auto-Kick-off power converter
    }
    else { 
        c4swbb.status.flags.GO = false; // Always Auto-Clear GO bit
    }
        
    return(1);
}

/*!Power Converter Auto-Start Function
 * **************************************************************************************************
 * 
 * **************************************************************************************************/

void __attribute__((__interrupt__, auto_psv, context))_C4SWBB_VOUT_ADCInterrupt(void)
{
    c4swbb.status.flags.adc_active = true;
    c4swbb.data.v_out = C4SWBB_VOUT_ADCBUF;

    c4swbb_vloop_Update(&c4swbb_vloop);

    _ADCAN16IF = 0;  // Clear the ADCANx interrupt flag 
    
}

