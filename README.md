# 🛡️ Zero 30 5G - Safe Banking & Root Hide (`v3.1-KSU`)

A lightweight, **100% bootloop-safe** KernelSU / KernelSU-Next module engineered to bypass strict banking and payment app security checks across **ColorOS, XOS, HiOS, and AOSP** custom ROMs.

> **Author:** Milner  
> **Target Environment:** KernelSU / KernelSU-Next (Strictly rejects Magisk/APatch to prevent conflicts)

---

## ✨ Features

- **Bootloop-Safe Execution:** Runs in a detached background subshell with a 60-second boot timeout so system startup is never blocked.
- **Debug & Build Spoofing:** Resets `ro.debuggable`, `ro.build.type` (`user`), and `ro.build.tags` (`release-keys`).
- **Bootloader State Masking:** Safely spoofs `ro.boot.verifiedbootstate` (`green`), `ro.boot.flash.locked` (`1`), and `vbmeta.device_state` (`locked`) when present.
- **Auto-Disable USB & Dev Flags:** Automatically resets `adb_enabled`, `development_settings_enabled`, and `adb_wifi_enabled` to `0` on every boot.
- **SuSFS Integration:** Automatically hides `/data/adb` and `/system/addon.d` paths if a SuSFS-enabled kernel is detected.
- **Smart Environment Audit:** Verifies Zygisk, Play Integrity/TrickyStore, and Hide My Applist (HMA) during installation.

---

## 📋 Prerequisites

1. **KernelSU / KernelSU-Next** manager installed.
2. **Play Integrity:** Passing `MEETS_DEVICE_INTEGRITY` or `MEETS_STRONG_INTEGRITY` (via ROM built-in PIF/TEE or **Play Integrity Fix + Tricky Store**).
3. **Zygisk + Xposed + HMA:** **NeoZygisk** (or ZygiskNext) + **Vector** (or LSPosed) + **Hide My Applist (HMA)**.

---

## ⚙️ Installation & Setup

1. Download the latest `Zero30_KSU_Banking_Safe_v3.1_Milner.zip` from the **[Releases](../../releases)** page.
2. Open **KernelSU / KernelSU-Next** Manager -> **Modules** -> **Install** and flash the ZIP.
3. Go to **KernelSU Settings** and enable:
   - `Umount modules`
   - `Kernel umount`
   *(Note: Never grant Superuser/Root access to banking apps).*
4. Open **Hide My Applist (HMA)**, create a **Blacklist** template containing all root/mod apps (`KernelSU`, `HMA`, `Termux`, `Shizuku`, etc.), and apply it to your banking/UPI apps.
5. **Clear Data** of your banking apps *(do not open them yet)* and **Reboot**.

---

## 💡 Important Notes

- **USB Debugging Auto-Off:** For security, USB Debugging and Developer Options will automatically turn off upon reboot.
- **New Banking Apps:** Whenever you install a new banking or payment app, apply your HMA template to it **before** opening it for the first time.
- **Emergency Safe Mode:** If you ever need to disable all KernelSU modules, press **Volume Down 3 times** during the boot animation.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
