/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/* 
 * File:   init_gpio.h
 * Author: M91406
 * Comments: header file of the GPIO initialization
 * Revision history: 
 * 1.0  initial version
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef INITIALIZE_GPIO_H
#define	INITIALIZE_GPIO_H

#include <xc.h> // include processor files - each processor file is guarded.  
#include <stdint.h>
#include <stdbool.h>

#include "globals.h"

#ifdef __4SWBB_dsPIC33CK__

    // TP4 on CK_DP_PIM
    #define DBGPIN1_SET         DBGPIN_SET
    #define DBGPIN_1_CLEAR      DBGPIN_CLEAR 
    #define DBGPIN_1_TOGGLE     DBGPIN_TOGGLE
    #define DBGPIN_1_INIT       DBGPIN_INIT_OUTPUT

    // Green LED on 4SWBB Board
    #define DBGPIN_2_SET        SCL_SET
    #define DBGPIN_2_CLEAR      SCL_CLEAR
    #define DBGPIN_2_TOGGLE     SCL_TOGGLE
    #define DBGPIN_2_INIT       SCL_INIT_OUTPUT

    // Red LED on 4SWBB Board
    #define DBGPIN_3_SET        SCL_SET
    #define DBGPIN_3_CLEAR      SCL_CLEAR
    #define DBGPIN_3_TOGGLE     SCL_TOGGLE
    #define DBGPIN_3_INIT       SCL_INIT_OUTPUT

#endif



#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

extern volatile uint16_t init_gpio(void);

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* INITIALIZE_GPIO_H */
