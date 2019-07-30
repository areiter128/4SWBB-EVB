/* ***************************************************************************************
 * z-Domain Control Loop Designer Version 0.9.0.61.
 * ***************************************************************************************
 * 2p2z compensation filter coefficients derived for following operating conditions:
 * ***************************************************************************************
 *
 * 	Controller Type:	2P2Z - Basic Current Mode Compensator
 * 	Sampling Frequency:	350000 Hz 
 * 	Fixed Point Format:	15
 * 	Scaling Mode:		2 - Single Bit-Shift with Output Factor Scaling
 * 	Input Gain:			0.148
 * 
 * ***************************************************************************************/

#include "c4swbb_vloop.h"

/* ***************************************************************************************
 * Data Arrays:
 * The cNPNZ_t data structure contains a pointer to derived coefficients in X-space and
 * other pointers to controller and error history in Y-space.
 * This source file declares the default parameters of the z-domain compensation filter.
 * These declarations are made publicly accessible through defines in c4swbb_vloop.h
 * ***************************************************************************************/

	volatile C4SWBB_VLOOP_CONTROL_LOOP_COEFFICIENTS_t __attribute__((space(xmemory), near)) c4swbb_vloop_coefficients; // A/B-Coefficients 
	volatile uint16_t c4swbb_vloop_ACoefficients_size = (sizeof(c4swbb_vloop_coefficients.ACoefficients)/sizeof(c4swbb_vloop_coefficients.ACoefficients[0])); // A-coefficient array size
	volatile uint16_t c4swbb_vloop_BCoefficients_size = (sizeof(c4swbb_vloop_coefficients.BCoefficients)/sizeof(c4swbb_vloop_coefficients.BCoefficients[0])); // B-coefficient array size

	volatile C4SWBB_VLOOP_CONTROL_LOOP_HISTORIES_t __attribute__((space(ymemory), far)) c4swbb_vloop_histories; // Control/Error Histories 
	volatile uint16_t c4swbb_vloop_ControlHistory_size = (sizeof(c4swbb_vloop_histories.ControlHistory)/sizeof(c4swbb_vloop_histories.ControlHistory[0])); // Control history array size
	volatile uint16_t c4swbb_vloop_ErrorHistory_size = (sizeof(c4swbb_vloop_histories.ErrorHistory)/sizeof(c4swbb_vloop_histories.ErrorHistory[0])); // Error history array size

/* ***************************************************************************************
 * 	Pole&Zero Placement:
 * ***************************************************************************************
 *
 * 	fP0:	300 Hz 
 * 	fP1:	60000 Hz 
 * 	fZ1:	300 Hz 
 *
 * ***************************************************************************************
 * 	Filter Coefficients and Parameters:
 * ***************************************************************************************/

	volatile fractional c4swbb_vloop_ACoefficients [2] = 
	{
		0x4629,	// Coefficient A1 will be multiplied with controller output u(n-1)
		0xEFD1	// Coefficient A2 will be multiplied with controller output u(n-2)
	};

	volatile fractional c4swbb_vloop_BCoefficients [3] = 
	{
		0x7FFF,	// Coefficient B0 will be multiplied with error input e(n)
		0x00B0,	// Coefficient B1 will be multiplied with error input e(n-1)
		0x80B1	// Coefficient B2 will be multiplied with error input e(n-2)
	};


	volatile int16_t c4swbb_vloop_pre_scaler = 3;
	volatile int16_t c4swbb_vloop_post_shift_A = -2;
	volatile int16_t c4swbb_vloop_post_shift_B = 0;
	volatile fractional c4swbb_vloop_post_scaler = 0x4BE5;

	volatile cNPNZ16b_t c4swbb_vloop; // user-controller data object

/* ***************************************************************************************/

uint16_t c4swbb_vloop_Init(void)
{
	volatile uint16_t i = 0;

	// Initialize controller data structure at runtime with pre-defined default values
	c4swbb_vloop.status.flags = CONTROLLER_STATUS_CLEAR;  // clear all status flag bits (will turn off execution))

	c4swbb_vloop.ptrACoefficients = &c4swbb_vloop_coefficients.ACoefficients[0]; // initialize pointer to A-coefficients array
	c4swbb_vloop.ptrBCoefficients = &c4swbb_vloop_coefficients.BCoefficients[0]; // initialize pointer to B-coefficients array
	c4swbb_vloop.ptrControlHistory = &c4swbb_vloop_histories.ControlHistory[0]; // initialize pointer to control history array
	c4swbb_vloop.ptrErrorHistory = &c4swbb_vloop_histories.ErrorHistory[0]; // initialize pointer to error history array
	c4swbb_vloop.normPostShiftA = c4swbb_vloop_post_shift_A; // initialize A-coefficients/single bit-shift scaler
	c4swbb_vloop.normPostShiftB = c4swbb_vloop_post_shift_B; // initialize B-coefficients/dual/post scale factor bit-shift scaler
	c4swbb_vloop.normPostScaler = c4swbb_vloop_post_scaler; // initialize control output value normalization scaling factor
	c4swbb_vloop.normPreShift = c4swbb_vloop_pre_scaler; // initialize A-coefficients/single bit-shift scaler

	c4swbb_vloop.ACoefficientsArraySize = c4swbb_vloop_ACoefficients_size; // initialize A-coefficients array size
	c4swbb_vloop.BCoefficientsArraySize = c4swbb_vloop_BCoefficients_size; // initialize A-coefficients array size
	c4swbb_vloop.ControlHistoryArraySize = c4swbb_vloop_ControlHistory_size; // initialize control history array size
	c4swbb_vloop.ErrorHistoryArraySize = c4swbb_vloop_ErrorHistory_size; // initialize error history array size


	// Load default set of A-coefficients from user RAM into X-Space controller A-array
	for(i=0; i<c4swbb_vloop.ACoefficientsArraySize; i++)
	{
		c4swbb_vloop_coefficients.ACoefficients[i] = c4swbb_vloop_ACoefficients[i];
	}

	// Load default set of B-coefficients from user RAM into X-Space controller B-array
	for(i=0; i<c4swbb_vloop.BCoefficientsArraySize; i++)
	{
		c4swbb_vloop_coefficients.BCoefficients[i] = c4swbb_vloop_BCoefficients[i];
	}

	// Clear error and control histories of the 2P2Z controller
	c4swbb_vloop_Reset(&c4swbb_vloop);

	return(1);
}


