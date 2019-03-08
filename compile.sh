#!/bin/bash

#if script permission denied use $chmod 755 your_script_name.sh

# Init Script

KERNEL_DIR=$PWD
ZIMAGE=$KERNEL_DIR/arch/arm/boot/zImage-dtb
BUILD_START=$(date +"%s")


#echo -e "Enter command for config \nIf alredy available enter menuconfig\n"
#read text
#echo "defconfig is: $text"


# Tweakable option below

export ARCH=arm								#architecture specific
export SUBARCH=arm
export KBUILD_BUILD_USER="RootFs-"
export CROSS_COMPILE="/home/ubuntu/arm-eabi-4.7/bin/arm-eabi-"		#toolchains directory



#Compilation script are below

echo -e "$****************************************************"
echo "               Compiling Arm 32 Kernel                  "
echo -e "*****************************************************"

#$sudo make $text			#for board specific configuration
$sudo make -j8			#to use available CPU


#if ![ -a $ZIMAGE ]; then
#echo -e "Kernel Compilation failed..!! Fix the errors..!"


