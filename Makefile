# Chỉ nấu cho chip 64-bit để tránh lỗi armv7
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

TWEAK_NAME = LSOBypass

LSOBypass_FILES = Tweak.x
LSOBypass_FRAMEWORKS = UIKit Foundation CoreGraphics
LSOBypass_LIBRARIES = substrate
LSOBypass_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
