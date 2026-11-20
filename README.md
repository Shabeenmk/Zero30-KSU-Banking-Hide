# 🛡️ Zero 30 5G - Safe Banking & Root Hide (`v3.2-KSU`)

A lightweight, **100% bootloop-safe** KernelSU / KernelSU-Next module engineered to bypass strict banking and payment app security checks across **ColorOS, XOS, HiOS, and AOSP** custom ROMs — now featuring a **1-Tap Action Toggle** with live status tracking for developers.

> **Author:** Milner  
> **Target Environment:** KernelSU / KernelSU-Next (Strictly rejects Magisk/APatch to prevent conflicts)

---

## ✨ What's New in `v3.2-KSU`

- **1-Tap Developer / Banking Toggle (`action.sh`):** Tap the **Action** button in KernelSU Manager to instantly switch between **Banking Mode (Safe)** and **Developer / ADB Mode (Active)** — **no reboot required**.
- **Live Status Indicator:** Displays the current active mode (`Status: 🛡️ Banking Mode (Safe)` or `Status: 🛠️ Developer / ADB Mode`) directly on the module card inside KernelSU Manager.
- **Seamless USB ADB Switching:** Dynamically toggles `ro.debuggable`, `adbd`, and USB gadget functions (`mtp,adb`) so PC ADB connections work reliably whenever needed.

---

## 🛡️ Core Security Features

- **Bootloop-Safe Execution:** Runs in a detached background subshell with a 60-second boot timeout so system startup is never blocked.
- **Debug & Build Spoofing:** Resets `ro.debuggable`, `ro.build.type` (`user`), and `ro.build.tags` (`release-keys`).
- **Bootloader State Masking:** Safely spoofs `ro.boot.verifiedbootstate` (`green`), `ro.boot.flash.locked` (`1`), and `vbmeta.device_state` (`locked`) when present.
- **Auto-Disable USB & Dev Flags:** Automatically resets `adb_enabled`, `development_settings_enabled`, and `adb_wifi_enabled` to `0` on every boot.
- **SuSFS Integration:** Automatically hides `/data/adb` and `/system/addon.d` paths if a SuSFS-enabled kernel is detected.

---

## 📋 Prerequisites

1. **KernelSU / KernelSU-Next** manager installed.
2. **Play Integrity:** Passing `MEETS_DEVICE_INTEGRITY` or `MEETS_STRONG_INTEGRITY` (via ROM built-in PIF/TEE or **Play Integrity Fix + Tricky Store**).
3. **Zygisk + Xposed + HMA:** **NeoZygisk** (or ZygiskNext) + **Vector** (or LSPosed) + **Hide My Applist (HMA)**.

---

## ⚙️ Installation & Setup

1. Download `Zero30_KSU_Banking_Safe_v3.2_Milner.zip` from the **[Releases](../../releases)** page.
2. Open **KernelSU / KernelSU-Next** Manager -> **Modules** -> **Install** and flash the ZIP.
3. Go to **KernelSU Settings** and enable:
- `Umount modules`
- `Kernel umount`
*(Note: Never grant Superuser/Root access to banking apps).*
4. Open **Hide My Applist (HMA)**, create a **Blacklist** template containing all root/mod apps (`KernelSU`, `HMA`, `Termux`, `Shizuku`, etc.), and apply it to your banking/UPI apps.
5. **Clear Data** of your banking apps *(do not open them yet)* and **Reboot**.

---

## 💡 Usage Tips

- **Switching to ADB Mode:** Open KernelSU Manager -> tap **Action** on this module -> connect USB cable to PC.
- **Returning to Banking Mode:** Unplug USB cable -> tap **Action** again -> open your banking app immediately (no reboot needed).
- **Emergency Safe Mode:** Press **Volume Down 3 times** during the boot animation to disable all KernelSU modules if ever needed.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
