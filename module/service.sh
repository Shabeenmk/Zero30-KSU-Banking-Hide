#!/system/bin/sh

(
    COUNT=0
    while [ "$(getprop sys.boot_completed)" != "1" ] && [ "$COUNT" -lt 30 ]; do
        sleep 2
        COUNT=$((COUNT + 1))
    done
    sleep 5

    resetprop ro.debuggable 0
    resetprop ro.secure 1
    resetprop ro.adb.secure 1
    resetprop ro.build.type user
    resetprop ro.build.tags release-keys

    [ -n "$(getprop ro.boot.verifiedbootstate)" ] && resetprop ro.boot.verifiedbootstate green
    [ -n "$(getprop ro.boot.flash.locked)" ] && resetprop ro.boot.flash.locked 1
    [ -n "$(getprop ro.boot.vbmeta.device_state)" ] && resetprop ro.boot.vbmeta.device_state locked
    [ -n "$(getprop sys.oem_unlock_allowed)" ] && resetprop sys.oem_unlock_allowed 0

    resetprop persist.sys.usb.config none
    resetprop sys.usb.config none
    settings put global adb_enabled 0 2>/dev/null
    settings put global development_settings_enabled 0 2>/dev/null
    settings put global adb_wifi_enabled 0 2>/dev/null

    if command -v ksu_susfs >/dev/null 2>&1; then
        ksu_susfs add_sus_path /data/adb 2>/dev/null
        ksu_susfs add_sus_path /system/addon.d 2>/dev/null
    fi
) &
