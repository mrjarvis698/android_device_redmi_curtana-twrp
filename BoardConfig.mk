#
# Copyright (C) 2019 The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/redmi/curtana

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := atoll
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := atoll
TARGET_BOARD_PLATFORM_GPU := qcom-adreno618

# Kernel
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 \
    androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 \
    msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 \
    earlycon=msm_geni_serial,0xa88000 loop.max_part=7 cgroup.memory=nokmem,nosocket \
    androidboot.usbconfigfs=true androidboot.boot_devices=soc/1d84000.ufshc \
    androidboot.selinux=permissive

BOARD_KERNEL_BASE            := 0x00000000
BOARD_KERNEL_PAGESIZE        := 4096
BOARD_KERNEL_OFFSET          := 0x00008000
BOARD_RAMDISK_OFFSET         := 0x01000000
BOARD_SECOND_OFFSET          := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET     := 0x00000100
BOARD_DTB_OFFSET             := 0x01f00000
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_INCLUDE_RECOVERY_DTBO  := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

TARGET_PREBUILT_KERNEL       := $(LOCAL_PATH)/prebuilt/Image.gz-dtb
TARGET_PREBUILT_DTB          := $(LOCAL_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE     := $(LOCAL_PATH)/prebuilt/dtbo.img

BOARD_MKBOOTIMG_ARGS := \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --dtb $(TARGET_PREBUILT_DTB)

# Assert
TARGET_OTA_ASSERT_DEVICE := curtana

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_PRODUCTIMAGE := true
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_METADATA_PARTITION := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 8388608 
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114934394880
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system product
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 16384

# Init
TARGET_INIT_VENDOR_LIB := libinit_curtana
TARGET_RECOVERY_DEVICE_MODULES := libinit_curtana
#TARGET_PLATFORM_DEVICE_BASE :=

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# TWRP specific build flags
TW_THEME := portrait_hdpi
#TW_Y_OFFSET :=
#TW_H_OFFSET :=
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
#TW_BRIGHTNESS_PATH :=
#TW_MAX_BRIGHTNESS :=
#TW_DEFAULT_BRIGHTNESS :=
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
TW_NO_USB_STORAGE := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_USE_TOOLBOX := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_HAS_EDL_MODE := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_SUPERSU := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31

# Platform version
PLATFORM_VERSION := 16.1.0
