$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/nubia/NX529J/NX529J-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/nubia/NX529J/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/nubia/NX529J/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/nubia/NX529J/twrp.fstab:recovery/root/etc/twrp.fstab

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Release name
PRODUCT_RELEASE_NAME := NX529J

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_NX529J
PRODUCT_DEVICE := NX529J
PRODUCT_BRAND := nubia
PRODUCT_MODEL := NX529J
PRODUCT_MANUFACTURER := nubia
