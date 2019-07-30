#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-4SWBB_dsPIC33CK.mk)" "nbproject/Makefile-local-4SWBB_dsPIC33CK.mk"
include nbproject/Makefile-local-4SWBB_dsPIC33CK.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=4SWBB_dsPIC33CK
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/init/init_fosc.c src/init/init_timer1.c src/init/init_gpio.c src/init/init_pwm.c src/init/init_acmp.c src/init/init_adc.c src/main.c src/config_bits.c src/ext_reference.c src/globals.c src/c4swbb_vloop.c src/c4swbb_vloop_asm.s src/pwr_control_4swbb.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/init/init_fosc.o ${OBJECTDIR}/src/init/init_timer1.o ${OBJECTDIR}/src/init/init_gpio.o ${OBJECTDIR}/src/init/init_pwm.o ${OBJECTDIR}/src/init/init_acmp.o ${OBJECTDIR}/src/init/init_adc.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/config_bits.o ${OBJECTDIR}/src/ext_reference.o ${OBJECTDIR}/src/globals.o ${OBJECTDIR}/src/c4swbb_vloop.o ${OBJECTDIR}/src/c4swbb_vloop_asm.o ${OBJECTDIR}/src/pwr_control_4swbb.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/init/init_fosc.o.d ${OBJECTDIR}/src/init/init_timer1.o.d ${OBJECTDIR}/src/init/init_gpio.o.d ${OBJECTDIR}/src/init/init_pwm.o.d ${OBJECTDIR}/src/init/init_acmp.o.d ${OBJECTDIR}/src/init/init_adc.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/config_bits.o.d ${OBJECTDIR}/src/ext_reference.o.d ${OBJECTDIR}/src/globals.o.d ${OBJECTDIR}/src/c4swbb_vloop.o.d ${OBJECTDIR}/src/c4swbb_vloop_asm.o.d ${OBJECTDIR}/src/pwr_control_4swbb.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/init/init_fosc.o ${OBJECTDIR}/src/init/init_timer1.o ${OBJECTDIR}/src/init/init_gpio.o ${OBJECTDIR}/src/init/init_pwm.o ${OBJECTDIR}/src/init/init_acmp.o ${OBJECTDIR}/src/init/init_adc.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/config_bits.o ${OBJECTDIR}/src/ext_reference.o ${OBJECTDIR}/src/globals.o ${OBJECTDIR}/src/c4swbb_vloop.o ${OBJECTDIR}/src/c4swbb_vloop_asm.o ${OBJECTDIR}/src/pwr_control_4swbb.o

# Source Files
SOURCEFILES=src/init/init_fosc.c src/init/init_timer1.c src/init/init_gpio.c src/init/init_pwm.c src/init/init_acmp.c src/init/init_adc.c src/main.c src/config_bits.c src/ext_reference.c src/globals.c src/c4swbb_vloop.c src/c4swbb_vloop_asm.s src/pwr_control_4swbb.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-4SWBB_dsPIC33CK.mk dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CK256MP506
MP_LINKER_FILE_OPTION=,--script=p33CK256MP506.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/init/init_fosc.o: src/init/init_fosc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_fosc.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_fosc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_fosc.c  -o ${OBJECTDIR}/src/init/init_fosc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_fosc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_fosc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_timer1.o: src/init/init_timer1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_timer1.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_timer1.c  -o ${OBJECTDIR}/src/init/init_timer1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_timer1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_timer1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_gpio.o: src/init/init_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_gpio.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_gpio.c  -o ${OBJECTDIR}/src/init/init_gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_gpio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_gpio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_pwm.o: src/init/init_pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_pwm.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_pwm.c  -o ${OBJECTDIR}/src/init/init_pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_acmp.o: src/init/init_acmp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_acmp.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_acmp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_acmp.c  -o ${OBJECTDIR}/src/init/init_acmp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_acmp.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_acmp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_adc.o: src/init/init_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_adc.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_adc.c  -o ${OBJECTDIR}/src/init/init_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/config_bits.o: src/config_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/config_bits.c  -o ${OBJECTDIR}/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/config_bits.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/config_bits.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/ext_reference.o: src/ext_reference.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ext_reference.o.d 
	@${RM} ${OBJECTDIR}/src/ext_reference.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/ext_reference.c  -o ${OBJECTDIR}/src/ext_reference.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/ext_reference.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/ext_reference.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/globals.o: src/globals.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/globals.o.d 
	@${RM} ${OBJECTDIR}/src/globals.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/globals.c  -o ${OBJECTDIR}/src/globals.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/globals.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/globals.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/c4swbb_vloop.o: src/c4swbb_vloop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop.o.d 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/c4swbb_vloop.c  -o ${OBJECTDIR}/src/c4swbb_vloop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/c4swbb_vloop.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/c4swbb_vloop.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/pwr_control_4swbb.o: src/pwr_control_4swbb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwr_control_4swbb.o.d 
	@${RM} ${OBJECTDIR}/src/pwr_control_4swbb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/pwr_control_4swbb.c  -o ${OBJECTDIR}/src/pwr_control_4swbb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/pwr_control_4swbb.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -mno-eds-warn  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/pwr_control_4swbb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/src/init/init_fosc.o: src/init/init_fosc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_fosc.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_fosc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_fosc.c  -o ${OBJECTDIR}/src/init/init_fosc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_fosc.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_fosc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_timer1.o: src/init/init_timer1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_timer1.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_timer1.c  -o ${OBJECTDIR}/src/init/init_timer1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_timer1.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_timer1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_gpio.o: src/init/init_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_gpio.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_gpio.c  -o ${OBJECTDIR}/src/init/init_gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_gpio.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_gpio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_pwm.o: src/init/init_pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_pwm.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_pwm.c  -o ${OBJECTDIR}/src/init/init_pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_pwm.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_pwm.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_acmp.o: src/init/init_acmp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_acmp.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_acmp.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_acmp.c  -o ${OBJECTDIR}/src/init/init_acmp.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_acmp.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_acmp.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/init/init_adc.o: src/init/init_adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/init" 
	@${RM} ${OBJECTDIR}/src/init/init_adc.o.d 
	@${RM} ${OBJECTDIR}/src/init/init_adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/init/init_adc.c  -o ${OBJECTDIR}/src/init/init_adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/init/init_adc.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/init/init_adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/main.c  -o ${OBJECTDIR}/src/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/main.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/config_bits.o: src/config_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/config_bits.c  -o ${OBJECTDIR}/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/config_bits.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/config_bits.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/ext_reference.o: src/ext_reference.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ext_reference.o.d 
	@${RM} ${OBJECTDIR}/src/ext_reference.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/ext_reference.c  -o ${OBJECTDIR}/src/ext_reference.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/ext_reference.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/ext_reference.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/globals.o: src/globals.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/globals.o.d 
	@${RM} ${OBJECTDIR}/src/globals.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/globals.c  -o ${OBJECTDIR}/src/globals.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/globals.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/globals.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/c4swbb_vloop.o: src/c4swbb_vloop.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop.o.d 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/c4swbb_vloop.c  -o ${OBJECTDIR}/src/c4swbb_vloop.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/c4swbb_vloop.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/c4swbb_vloop.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/src/pwr_control_4swbb.o: src/pwr_control_4swbb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwr_control_4swbb.o.d 
	@${RM} ${OBJECTDIR}/src/pwr_control_4swbb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  src/pwr_control_4swbb.c  -o ${OBJECTDIR}/src/pwr_control_4swbb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/pwr_control_4swbb.o.d"      -mno-eds-warn  -g -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -O0 -I"h" -I"h/init" -I"src" -I"src/init" -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/src/pwr_control_4swbb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/c4swbb_vloop_asm.o: src/c4swbb_vloop_asm.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop_asm.o.d 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  src/c4swbb_vloop_asm.s  -o ${OBJECTDIR}/src/c4swbb_vloop_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  -I"h" -I"h/init" -I"src" -I"src/init" -Wa,-MD,"${OBJECTDIR}/src/c4swbb_vloop_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD4=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/src/c4swbb_vloop_asm.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/src/c4swbb_vloop_asm.o: src/c4swbb_vloop_asm.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop_asm.o.d 
	@${RM} ${OBJECTDIR}/src/c4swbb_vloop_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  src/c4swbb_vloop_asm.s  -o ${OBJECTDIR}/src/c4swbb_vloop_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  -I"h" -I"h/init" -I"src" -I"src/init" -Wa,-MD,"${OBJECTDIR}/src/c4swbb_vloop_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/src/c4swbb_vloop_asm.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_ICD4=1  -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init"  -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_ICD4=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -D__4SWBB_dsPIC33CK__ -DXPRJ_4SWBB_dsPIC33CK=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I"h" -I"h/init" -I"src" -I"src/init" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/4swbb_acmc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/4SWBB_dsPIC33CK
	${RM} -r dist/4SWBB_dsPIC33CK

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
