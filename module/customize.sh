ui_print "=========================================="
ui_print "  Zero 30 5G Safe Banking Hide (v3.1-KSU) "
ui_print "                by Milner                 "
ui_print "=========================================="

if [ "$KSU" != "true" ]; then
    abort "! ERROR: This module is strictly for KernelSU / KernelSU-Next only!"
fi

if [ -f "/data/adb/service.d/banking_hide.sh" ]; then
    ui_print "- Cleaning up legacy banking_hide.sh..."
    rm -f /data/adb/service.d/banking_hide.sh
fi

ui_print "- Verifying environment..."

if ls -d /data/adb/modules/*zygisk* >/dev/null 2>&1; then
    ui_print "  [OK] Zygisk implementation found."
else
    ui_print "  [!] NOTE: Zygisk (NeoZygisk/ZygiskNext) not detected."
fi

if ls -d /data/adb/modules/*integrity* /data/adb/modules/*tricky* >/dev/null 2>&1; then
    ui_print "  [OK] Play Integrity / TrickyStore detected."
else
    ui_print "  [i] INFO: No external PIF/TrickyStore found."
    ui_print "      (Fine if your ROM has built-in Integrity & TEE)"
fi

if ls -d /data/data/*hidemyapplist* /data/user/0/*hidemyapplist* /data/app/*/*hidemyapplist* >/dev/null 2>&1; then
    ui_print "  [OK] Hide My Applist (HMA) detected."
else
    ui_print "  [!] NOTE: Hide My Applist (HMA) not installed."
fi

ui_print "- Setting safe permissions..."
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755

ui_print "------------------------------------------"
ui_print " SETUP CHECKLIST BEFORE REBOOT:"
ui_print " 1. Enable \"Umount modules\" & \"Kernel umount\""
ui_print "    in KernelSU Manager Settings."
ui_print " 2. Hide root apps from banking apps in HMA."
ui_print " 3. Clear data of banking apps & Reboot."
ui_print "------------------------------------------"
