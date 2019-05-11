# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Moto X Pro Kernel by Jingshao@QQ2239298161
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=shamu
device.name2=Shamu
device.name3=shamu_t
device.name4=Shamu_t
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;


# begin ramdisk changes

# init.shamu.rc
backup_file init.shamu.rc;
append_file init.shamu.rc "Moto X Pro" init.shamu.add;

# fstab.shamu
backup_file fstab.shamu;
replace_file fstab.shamu 750 fstab.shamu.replace;

# ueventd.shamu.rc
backup_file ueventd.shamu.rc
append_file ueventd.shamu.rc "Moto Sensors" ueventd.shamu.add;

# end ramdisk changes

write_boot;

## end install
