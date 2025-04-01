#!/bin/bash
set -v
PHONE_ROOT="/oneplus7pro-lin"
DRIVER_ROOT="/oneplus7pro-lin-system_dump"
rm -rf $PHONE_ROOT
mkdir $PHONE_ROOT
chmod 777 $PHONE_ROOT
cd $PHONE_ROOT
repo init -u https://github.com/LineageOS/android.git -b lineage-22.1 --git-lfs --no-clone-bundle


max_attempts=10
attempt=1

until repo sync; do
    if [ $attempt -ge $max_attempts ]; then
        echo "error: Tried $attempt Times failed exit!!!!!!!!!!!!!!!!!!!!"
        echo compile failed!!!!!
        exit 1
    fi
    echo "error: failed times: $attempt , retrying!!!!!"
    attempt=$((attempt + 1))
    sleep 1 
done

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 100G

source build/envsetup.sh
breakfast guacamole 
bash $DRIVER_ROOT/extract.sh
cd $PHONE_ROOT
breakfast guacamole 

cd $PHONE_ROOT/kernel/oneplus/sm8150
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -s v0.9.5
sed -i '$a CONFIG_KPROBES=y' arch/arm64/configs/lineage_sm8150_defconfig
sed -i '$a CONFIG_HAVE_KPROBES=y' arch/arm64/configs/lineage_sm8150_defconfig
sed -i '$a CONFIG_KPROBE_EVENTS=y' arch/arm64/configs/lineage_sm8150_defconfig

cd $PHONE_ROOT
breakfast guacamole 
brunch guacamole
zipFile=`find out/target/product/guacamole/ -maxdepth 1 -type f -name "*UNOFFICIAL*.zip"`
if [ -z "$zipFile" ]; then
  echo compile failed!!!!!
  exit 1
fi
bootFile="out/target/product/guacamole/boot.img"
dtboFile="out/target/product/guacamole/dtbo.img"
vbmetaFile="out/target/product/guacamole/vbmeta.img"
vendorFile="out/target/product/guacamole/vendor.img"
filesIMG="$zipFile $zipFile.sha256sum $bootFile $dtboFile $vbmetaFile $vendorFile"
gh release create v`date +"%Y%m%d"` $filesIMG --repo YOUR_USER_NAME/kernelsu_oneplus_7_pro_lineageos_guacamole --title v`date +"%Y%m%d"` --notes "Automatically generated"
