# kernelsu_oneplus_7_pro_lineageos_guacamole
A working KernelSU build for the OnePlus 7 Pro (codename Guacamole) on LineageOS.


# WARNING: A data wipe and factory reset are MANDATORY to use this build! Flashing only the boot.img will cause your device to lose Wi-Fi and sound functionality.

# WARNING: After installation, OTA updates can only be applied using packages signed with Android test keys. This means you will not be able to use official builds for OTA upgrades after installation.

# CAUTION: This build may potentially DAMAGE your device. Proceed at your own risk! Always make a backup before each update!

# Installation

[Github releases](https://github.com/surfaceocean/kernelsu_oneplus_7_pro_lineageos_guacamole/releases)

This process is similar to the [official guide](https://wiki.lineageos.org/devices/guacamole/install/).

Remember to factory reset before and after the installation of [MindTheGapps](https://wiki.lineageos.org/gapps/).

The installation requires a factory reset and flashing of dtbo.img, vbmeta.img, boot.img, and lineage-21.0.zip according to the official guide. After installation, all future updates must be performed through the built-in OTA updater using the latest .zip releases available here.


# Notice
1. I attempted to compile only the kernel boot.img and flashed it on the official LineageOS system, but I lost Wi-Fi and sound functionality. The only solution that works is to compile both the kernel boot.img and the entire system together. Can anyone explain why this happened?
2. The build is updated weekly. I will mark the personally tested versions here.
3. This device uses a non-GKI kernel, and KernelSU v0.9.5 is the last supported version for it.

# Working versions
- v20240918
- v20240919
- v20240923

# Source Code

Disclaimer: This ROM contains no modifications to the LineageOS source code except for the inclusion of the KernelSU codebase. You can access the source code below:

- [Lineageos](https://github.com/LineageOS/android)
- [Kernel](https://github.com/LineageOS/android_kernel_oneplus_sm8150)
- [KernelSU](https://github.com/tiann/KernelSU)
