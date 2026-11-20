#!/system/bin/sh
MODDIR=${0%/*}
CURRENT_ADB=$(settings get global adb_enabled)

if [ "$CURRENT_ADB" = "1" ]; then
    resetprop ro.debuggable 0
    resetprop ro.adb.secure 1
    settings put global adb_enabled 0
    settings put global adb_wifi_enabled 0
    settings put global development_settings_enabled 0
    svc usb setFunctions mtp 2>/dev/null
    stop adbd 2>/dev/null
    sed -i "s/^description=.*/description=Status: 🛡️ Banking Mode (Safe) | 100% Bootloop-safe KSU module with 1-tap Action toggle for ADB\/Banking mode./" "$MODDIR/module.prop"
    echo "=========================================="
    echo " Status: 🛡️ BANKING MODE (SAFE)"
    echo " Debug props & ADB DISABLED."
    echo " Banking apps ready (No reboot needed)!"
    echo "=========================================="
else
    resetprop ro.debuggable 1
    resetprop ro.adb.secure 0
    settings put global development_settings_enabled 1
    settings put global adb_enabled 1
    svc usb setFunctions mtp,adb 2>/dev/null
    start adbd 2>/dev/null
    sed -i "s/^description=.*/description=Status: 🛠️ Developer \/ ADB Mode (Active) | Tap Action again to return to Banking Mode./" "$MODDIR/module.prop"
    echo "=========================================="
    echo " Status: 🛠️ DEVELOPER / ADB MODE (ACTIVE)"
    echo " ADB Daemon STARTED. Re-plug USB cable!"
    echo "=========================================="
fi
