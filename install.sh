
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=true

# Set to true if you need late_start service script
LATESTARTSERVICE=true


# Construct your own list here
REPLACE="
/system/vendor/lib64/soundfx/libvolumelistener.so
/system/vendor/lib/soundfx/libvolumelistener.so
/system/vendor/overlay/framework-res__auto_generated_rro_vendor.apk
/system/vendor/overlay/SettingsGoogle__auto_generated_rro_vendor.apk
/system/vendor/overlay/SettingsProvider__auto_generated_rro_vendor.apk
/system/vendor/overlay/SystemUIGoogle__auto_generated_rro_vendor.apk
/system/vendor/overlay/Telecom__auto_generated_rro_vendor.apk
/system/vendor/overlay/TeleService__auto_generated_rro_vendor.apk
/system/vendor/overlay/Traceur__auto_generated_rro_vendor.apk
/system/product/priv-app/GoogleCamera
/system/usr/idc/uinput-fpc.idc
/system/usr/idc/uinput-goodix.idc
/system/usr/keylayout/gpio-keys.kl
/system/usr/keylayout/uinput-fpc.kl
/system/usr/keylayout/uinput-goodix.kl
/system/system_ext/priv-app/HbmSVManager
/system/system_ext/priv-app/YadaYada
/system/framework/services.jar
"
# Enable silky GBoard
##########################################################################################

XML=/data/data/com.google.android.inputmethod.latin/shared_prefs/flag_value.xml

sed -i -e 's/"pill_shaped_key" value="false"/"pill_shaped_key" value="true"/g' $XML
sed -i -e 's/"silk_theme" value="false"/"silk_theme" value="true"/g' $XML
sed -i -e 's/"use_silk_theme_by_default" value="false"/"use_silk_theme_by_default" value="true"/g' $XML
sed -i -e 's/"enable_keyboard_redesign" value="false"/"enable_keyboard_redesign" value="true"/g' $XML
sed -i -e 's/"enable_keyboard_redesign_theme" value="false"/"enable_keyboard_redesign_theme" value="true"/g' $XML
sed -i -e 's/"use_keyboard_redesign_by_default" value="false"/"use_keyboard_redesign_by_default" value="true"/g' $XML
sed -i -e 's/"use_keyboard_redesign_on_existing_theme_on_all_users" value="false"/"use_keyboard_redesign_on_existing_theme_on_all_users" value="true"/g' $XML 
sed -i -e 's/"use_keyboard_redesign_on_existing_theme" value="false"/"use_keyboard_redesign_on_existing_theme" value="true"/g' $XML
  sed -i -e 's/"silk_on_all_pixel" value="false"/"silk_on_all_pixel" value="true"/g' $XML

am force-stop com.google.android.inputmethod.latin


##########################################################################################

##########################################################################################
#
# Function Callbacks
#
# The following functions will be called by the installation framework.
# You do not have the ability to modify update-binary, the only way you can customize
# installation is through implementing these functions.
#
# When running your callbacks, the installation framework will make sure the Magisk
# internal busybox path is *PREPENDED* to PATH, so all common commands shall exist.
# Also, it will make sure /data, /system, and /vendor is properly mounted.
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! DO NOT use any Magisk internal paths as those are NOT public API.
# ! DO NOT use other functions in util_functions.sh as they are NOT public API.
# ! Non public APIs are not guranteed to maintain compatibility between releases.
#
# Available variables:
#
# MAGISK_VER (string): the version string of current installed Magisk
# MAGISK_VER_CODE (int): the version code of current installed Magisk
# BOOTMODE (bool): true if the module is currently installing in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module's installation zip
# ARCH (string): the architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device
#
# Availible functions:
#
# ui_print <msg>
#     print <msg> to console
#     Avoid using 'echo' as it will not display in custom recovery's console
#
# abort <msg>
#     print error message <msg> to console and terminate installation
#     Avoid using 'exit' as it will skip the termination cleanup steps
#
# set_perm <target> <owner> <group> <permission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     this function is a shorthand for the following commands
#       chown owner.group target
#       chmod permission target
#       chcon context target
#
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context
#
##########################################################################################
##########################################################################################
# If you need boot scripts, DO NOT use general boot scripts (post-fs-data.d/service.d)
# ONLY use module scripts as it respects the module status (remove/disable) and is
# guaranteed to maintain the same behavior in future Magisk releases.
# Enable boot scripts by setting the flags in the config section above.
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
  ui_print "hi"
}

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
#    cd $TMPDIR
#    unzip -o $ZIPFILE
#    cp -af system $MODPATH
#    cp -af system.prop $MODPATH
#    cp -af service.sh $MODPATH
#    cp -af post-fs-data.sh $MODPATH

#    mkdir $MODPATH/system/bin
#    sed '/mount -o bind \/mnt\/phh\/empty_dir \/vendor\/etc\/audio/d' /system/bin/rw-system.sh > $MODPATH/system/bin/rw-system.sh
#    chown root:shell $MODPATH/system/bin/rw-system.sh

}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644

#  set_perm $MODPATH/service.sh 0 0 0755
#  set_perm $MODPATH/post-fs-data.sh 0 0 0755
#  set_perm $MODPATH/system/bin/rw-system.sh 0 0 755 u:object_r:phhsu_exec:s0


  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644

}

# You can add more functions to assist your custom script code
