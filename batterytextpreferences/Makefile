TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = batterytextpreferences

batterytextpreferences_FILES = BTRootListController.m
batterytextpreferences_FRAMEWORKS = UIKit
batterytextpreferences_PRIVATE_FRAMEWORKS = Preferences
batterytextpreferences_INSTALL_PATH = /Library/PreferenceBundles
batterytextpreferences_CFLAGS = -fobjc-arc

batterytextpreferences_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk
