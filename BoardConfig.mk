USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/nubia/NX529J/BoardConfigVendor.mk

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := NX529J

# Architecture
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := msm8952
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=null androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS :=  --ramdisk_offset 0x02000000 --tags_offset 0x00000100 --dt device/nubia/NX529J/dt.img
TARGET_PREBUILT_KERNEL := device/nubia/NX529J/kernel

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 58711849984
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_FSTAB := device/nubia/NX529J/twrp.fstab

BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP
TW_THEME := portrait_hdpi
