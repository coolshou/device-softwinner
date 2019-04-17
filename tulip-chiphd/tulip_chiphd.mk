$(call inherit-product, device/softwinner/tulip-chiphd/device.mk)
$(call inherit-product, build/target/product/full_base.mk)

GAPPS_VARIANT := micro
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true

PRODUCT_PACKAGES += \
    Launcher3

# without SuperSU.apk, it will direct grent root access when app require,
# if there is SuperSU.apk, it will popup to ask User confirm
#GAPPS_EXCLUDED_PACKAGES += \
#    SuperSU
#GAPPS_EXCLUDED_PACKAGES += \
#    CalendarGooglePrebuilt \
#    FaceLock \
#    GoogleBackupTransport \
#    GoogleCalendarSyncAdapter \
#    GoogleContactsSyncAdapter \
#    GoogleFeedback \
#    GoogleLoginService \
#    GoogleNow \
#    GoogleOneTimeInitializer \
#    GooglePackageInstaller \
#    GooglePartnerSetup \
#    GoogleServicesFramework \
#    GoogleTTS \
#    Phonesky \
#    PrebuiltExchange3Google \
#    PrebuiltGmail \
#    PrebuiltGmsCore \
#    PrebuiltGmsCoreInstantApps \
#    SetupWizard \
#    Turbo \
#    Velvet
#cameraserver

#wpa_supplicant config
PRODUCT_COPY_FILES += \
    device/softwinner/tulip-common/wpa_supplicant.conf:/data/misc/wifi/wpa_supplicant.conf \
    device/softwinner/tulip-common/p2p_supplicant.conf:/data/misc/wifi/p2p_supplicant.conf

PRODUCT_COPY_FILES += \
    device/softwinner/common/config/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

PRODUCT_COPY_FILES += \
    hardware/aw/audio/tulip/a64_paths.xml:system/etc/a64_paths.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    device/softwinner/tulip-chiphd/configs/camera.cfg:system/etc/camera.cfg

# Radio Packages and Configuration Flie
$(call inherit-product, device/softwinner/common/rild/radio_common.mk)
#$(call inherit-product, device/softwinner/common/ril_modem/huawei/mu509/huawei_mu509.mk)
#$(call inherit-product, device/softwinner/common/ril_modem/Oviphone/em55/oviphone_em55.mk)

# mdpi, while we are hardcoding the 1080 resolution.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density.480=160 \
	ro.sf.lcd_density.576=160 \
	ro.sf.lcd_density.600=160 \
	ro.sf.lcd_density.720=160 \
	ro.sf.lcd_density.1080=160 \
	ro.sf.lcd_density.2160=320

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hdmi.device_type=4

PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := mdpi large xlarge
PRODUCT_AAPT_PREF_CONFIG := mdpi

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

PRODUCT_BRAND := Allwinner
PRODUCT_NAME := tulip_chiphd
PRODUCT_DEVICE := tulip-chiphd
PRODUCT_MODEL := PINE A64
PRODUCT_MANUFACTURER := Allwinner
