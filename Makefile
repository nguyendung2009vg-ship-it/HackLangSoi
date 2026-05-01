ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = Werewolf

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LSOBypass
LSOBypass_FILES = Tweak.x
LSOBypass_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
