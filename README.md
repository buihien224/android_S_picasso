# # Android S for Picasso
`Hi this is a instruction to install android S gsi on Picasso` .


# Required 

 -  [Gsi img](https://dl.google.com/developers/android/sc/images/gsi/gsi_gms_arm64-exp-SPB2.210513.007-7398525-ad5569cb.zip)
 - [MIUI 12.5](https://hugeota.d.miui.com/V12.5.2.0.RGICNXM/miui_PICASSO_V12.5.2.0.RGICNXM_8f5c35ebbc_11.0.zip)
 - [OFRP](https://orangefox.download/device/picasso)
 - [FASTBOOT](FASTBOOT%20tool) tool

##  Prepare

 1.  **Download all files in this repository**
 2.  **Install orange fox recovery**
 3.  **Flash miui 12.5**
 4.  ** Move to Fastboot folder you just extracted**
 5. ** Extract gsi img .zip to Fastboot folder **
 6. **When flash done , go to fastboot mode**
 

# Flashing time
**in computer open CMD/Terminal in Fastboot folder** 

**In fastboot** , type

    fastboot reboot fastboot
   **Now we in Fastbootd** , do
   

> Touch **Enable ADB** 
> *wait 3 second* 
> Touch **Enable FASTBOOT** 

    fastboot flash vbmeta vbmeta.img
    fastboot erase system 
    fastboot flash system system.img
    fastboot reboot recovery
  **In recovery** , do
  

> Format data , reboot to recovery again
> Flash Magisk , reboot to system

**In system** , do

    Setup 
    Open Magisk and update
    Flash soundfix.zip as magisk module 
    to fix audio
    
   **install 120fps.apk to enable 120hz**
   
  **Optional** 
  

 - Enable Material You 
	 - Flash **Riru** module 
	 - Flash **LSposed** module
	 - Flash **A12 extension** module
	 - reboot and follow **A12 extension** instruction
	
 - Install Pixel launcher
	 - install  **NexusLauncherRelease.apk**
	 - install **quickswitch**
	 - choose *pixel launcher* in  **quickswitch**
	 -  reboot

    

