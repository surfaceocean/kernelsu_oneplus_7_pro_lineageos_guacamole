#!/bin/bash
ROOT_PATH="/oneplus7pro-lin-system_dump"
PHONE_ROOT="/oneplus7pro-lin"
cd $ROOT_PATH
rm -rf ./official_root
mkdir ./official_root
unzip lineage.zip -d ./official_root/
cd ./official_root
../android/prebuilts/extract-tools/linux-x86/bin/ota_extractor --payload payload.bin
cd ..
sudo /bin/mount -o rw $ROOT_PATH/official_root/system.img $ROOT_PATH/ro_system
sudo /bin/mount -o rw $ROOT_PATH/official_root/vendor.img $ROOT_PATH/ro_system/vendor
cp -r ro_system/system official_root/
cp -r ro_system/vendor official_root/
find official_root/   -type d -exec chmod 777 {} \;
find official_root/  -type f -exec chmod 666 {} \;
cd $PHONE_ROOT/device/oneplus/guacamole
./extract-files.py $ROOT_PATH/official_root
cd $ROOT_PATH
sudo /bin/umount $ROOT_PATH/ro_system/vendor
sudo /bin/umount $ROOT_PATH/ro_system
