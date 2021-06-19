# Android S for Picasso

1. download gsi img : https://dl.google.com/developers/android/sc/images/gsi/gsi_gms_arm64-exp-SPB2.210513.007-7398525-ad5569cb.zip and extract 
2. download miui 12.5 cn : https://hugeota.d.miui.com/V12.5.2.0.RGICNXM/miui_PICASSO_V12.5.2.0.RGICNXM_8f5c35ebbc_11.0.zip
3. download OFRP, FASTBOOT tool : https://orangefox.download/device/picasso & https://developer.android.com/studio/releases/platform-tools
4. download all files in this repository

  flash miui and format data
  enter to fastboot
fastboot reboot fastboot
  in fastbootd , touch "enable adb" after 5s touch "enable fastboot"
fastboot erase system

fastoot flash vbmeta vbmeta.img

fastboot flash system system.img

fastboot -w

astboot reboot recovery

  flash magisk and reboot
 open magisk 
 flash riru
 flash lsposed
 flash extension
 flash soudfix
 
 reboot
 
 open extension and follow it instruction
 
 to enable 120hz , install 120fps.apk and toggle to 120h
 
 bug call audio
