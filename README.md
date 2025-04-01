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

# How to Compile on Your Own
1. Modify PHONE_ROOT DRIVER_ROOT(ROOT_PATH) to existing empty folder in build.sh and extract.sh. Make sure extract.sh is in DRIVER_ROOT(ROOT_PATH).
2. Download the lastest LineageOS build for OnePlus 7 Pro [here](https://download.lineageos.org/devices/guacamole/builds). Save it to lineage.zip in DRIVER_ROOT(ROOT_PATH) in order to extract drivers.
3. Run build.sh.
4. The target builds are in $PHONE_ROOT/out/target/product/guacamole.

# Notice
1. I attempted to compile only the kernel boot.img and flashed it on the official LineageOS system, but I lost Wi-Fi and sound functionality. The only solution that works is to compile both the kernel boot.img and the entire system together. Can anyone explain why this happened?
2. This device uses a non-GKI kernel, and KernelSU v0.9.5 is the last supported version for it.


# Source Code

Disclaimer: This ROM contains no modifications to the LineageOS source code except for the inclusion of the KernelSU codebase. You can access the source code below:

- [Lineageos](https://github.com/LineageOS/android)
- [Kernel](https://github.com/LineageOS/android_kernel_oneplus_sm8150)
- [KernelSU](https://github.com/tiann/KernelSU)
