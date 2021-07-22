SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true
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
/system/vendor/lib/btaudio_offload_if.so
/system/vendor/lib/hw/android.hardware.audio.effect@5.0-impl.so
/system/vendor/lib/hw/android.hardware.audio@5.0-impl.so
/system/vendor/lib/hw/android.hardware.bluetooth.audio@2.0-impl.so
/system/vendor/lib/hw/android.hardware.bluetooth@1.0-impl-qti.so
/system/vendor/lib/hw/audio.bluetooth.default.so
/system/vendor/lib/libbluetooth_audio_session.so
/system/vendor/lib/libbluetooth_audio_session_qti.so
/system/vendor/lib64/btaudio_offload_if.so 
/system/vendor/lib64/hw/android.hardware.bluetooth.audio@2.0-impl.so
/system/vendor/lib64/hw/android.hardware.bluetooth@1.0-impl-qti.so
/system/vendor/lib64/hw/audio.bluetooth.default.so
/system/vendor/lib64/liba2dpoffload.so
/system/vendor/lib64/libbluetooth_audio_session.so
/system/vendor/lib64/libbluetooth_audio_session_qti.so
/system/vendor/build.prop
/system/system_ext/priv-app/HbmSVManager
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
### Display on Magisk installation

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
