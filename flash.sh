#!/bin/bash


echo -e "move to boot folder\n"
~/boot
sleep 0.2s

echo -e "\nDelete kernel and ramdisk\n"
rm kernel ramdisk.cpio.gz
sleep 0.3s

echo -e "\n Unpack Image\n"
~/tools/unmkbootimg -i boot.img > temp.txt

echo -e "\nremoving kernel"
rm kernel
sleep 0.5s

echo -e "\nCopying new kernel"
cp ~/msm-3.4.0-gadb2201/arch/arm/boot/zImage-dtb ~/boot/kernel

sleep 2s
sed 's/ */\\\n/' temp.txt > new.txt	#file alignment
		
cat new.txt
mk= sed -n -e '10,11p' new.txt		#getting specific line
sleep 2s
rm temp.txt new.txt

eval ~/tools/$'$mk'
sleep 1s

adb reboot bootloader
sleep 3s
fastboot flash boot boot.img
sleep 4s
fastboot reboot

exit 1
