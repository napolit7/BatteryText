TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpBoard

FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BatteryText

BatteryText_FILES = Tweak.x Themes.m
BatteryText_CFLAGS = -fobjc-arc

BatteryText_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += batterytextpreferences

include $(THEOS_MAKE_PATH)/aggregate.mk