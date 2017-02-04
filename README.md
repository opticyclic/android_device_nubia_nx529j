# TWRP Device Tree for ZTE Nubia Z11 Mini

This is to compile TWRP using omnirom sources.

It is currently using a prebuilt kernel and device tree blob (dt.img) extracted from a device.

    Build Number - NX529J_CNCommon_V1.26
    Android security patch level - 2016-02-01
    Kernel version  - 3.10.73-perf-g7a5d521-00492-g32de588 nubia@swlab-1t188 #1
    Android version 5.1.1

The official kernel source is https://github.com/ztemt/NX529J_L_kernel but it doesn't compile with this config yet.

## Get The Code

Since we are only compiling TWRP and not a full ROM we will get a minimal checkout.
We are using Omnirom as the TWRP source is included.
The Z11 Mini comes with Android 5.1 so we will get branch `twrp-5.1`.

    mkdir -p ~/android/twrp
    cd ~/android/twrp
    repo init -u git://github.com/lj50036/platform_manifest_twrp_omni.git --depth=1 -b twrp-5.1
    repo --time sync --no-clone-bundle -j8

You can change the number of threads (simultaneous downloads) by changing `j8` (twice number of CPU cores is a good start).

- `--time` will output the time taken at the end.
- `--depth=1` means only get the last commit and not the entire history which should reduce the amount downloaded.
- `--no-clone-bundle` will reduce the download further by disabling git bundles that aren't affected by the `-c` option.

This took 15mins to download on my 15MB/s connection.
The .repo dir was about 1.5 GB in size and the full twrp dir (including the 1.5GB .repo) was about 6.6 GB.


To get this device we add a local manifest called `.repo/local_manifests/nx529j.xml`:

    <?xml version="1.0" encoding="UTF-8"?>
    <manifest>
        <project path="device/nubia/NX529J" name="opticyclic/android_device_nubia_nx529j" remote="github" revision="master" />
    </manifest>

Then run `repo --time sync -j8` to check it out.

## Build Instructions

    source build/envsetup.sh
    lunch omni_NX529J-userdebug
    make clean;make recoveryimage

## Test On Your Phone

You don't want to flash it right away and overwrite the existing recovery just in case there are bugs!

What you can do is load it temporarily by using `fastboot boot` instead of `fastboot flash`.

Here we are using `sudo` and forcing the vendor id as this version of fastboot doesn't recognise the phone as it is not the latest version of fastboot.

    adb reboot bootloader
    sudo fastboot -i 0x19d2 boot out/target/product/NX529J/recovery.img

If you are happy with it you can replace your existing recovery with

    adb reboot bootloader
    sudo fastboot -i 0x19d2 flash out/target/product/NX529J/recovery.img

**NB:** The latest version of fastboot now recognises the phone so you can skip the `-i 0x19d2` if you are up to date.
