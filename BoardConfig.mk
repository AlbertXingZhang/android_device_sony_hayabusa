#inherit from the common blue definitions
include device/sony/blue-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/hayabusa/include

TARGET_KERNEL_CONFIG := cm_blue_hayabusa_defconfig

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 18

# the following two sizes are generous guesses
# since these partitions are not visible
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01400000

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1056964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/hayabusa/bluetooth

TARGET_LS_USE_ALS_NODE := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Healthd
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight_1/brightness
SECONDARY_BACKLIGHT_PATH := /sys/class/leds/lcd-backlight_2/brightness
RED_LED_PATH := /sys/class/leds/pwr-red/brightness
GREEN_LED_PATH := /sys/class/leds/pwr-green/brightness
BLUE_LED_PATH := /sys/class/leds/pwr-blue/brightness

TARGET_OTA_ASSERT_DEVICE := lt29i,hayabusa,LT29i

BOARD_HARDWARE_CLASS := device/sony/hayabusa/cmhw

# Custom sepolicy for hardware
BOARD_SEPOLICY_DIRS += \
    device/sony/hayabusa/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    file.te \
    healthd.te \
    system_server.te

# inherit from the proprietary version
-include vendor/sony/hayabusa/BoardConfigVendor.mk
