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

    // Green LED on 4SWBB Board
    #define DBGLED_GN_SET       ECP53_SET
    #define DBGLED_GN_CLEAR     ECP53_CLEAR
    #define DBGLED_GN_TOGGLE    ECP53_TOGGLE
    #define DBGLED_GN_INIT      ECP53_INIT_OUTPUT

    // Red LED on 4SWBB Board
    #define DBGLED_RD_SET       ECP55_SET
    #define DBGLED_RD_CLEAR     ECP55_CLEAR
    #define DBGLED_RD_TOGGLE    ECP55_TOGGLE
    #define DBGLED_RD_INIT      ECP55_INIT_OUTPUT

#endif



#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

extern volatile uint16_t init_gpio(void);

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* INITIALIZE_GPIO_H */
