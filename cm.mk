# Release name
PRODUCT_RELEASE_NAME := NX529J

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/nubia/NX529J/device_NX529J.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := NX529J
PRODUCT_NAME := cm_NX529J
PRODUCT_BRAND := nubia
PRODUCT_MODEL := NX529J
PRODUCT_MANUFACTURER := nubia
