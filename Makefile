# Tên của Tweak mày đang làm
TWEAK_NAME = LSOBypass

# Chỉ định file xử lý chính (đảm bảo file này tên là Tweak.x)
LSOBypass_FILES = Tweak.x

# Thêm các Framework cần thiết để chạy giao diện Menu
LSOBypass_FRAMEWORKS = UIKit Foundation CoreGraphics

# Thêm thư viện Substrate để thực hiện việc Hook vào Game
LSOBypass_LIBRARIES = substrate

# Cấu hình biên dịch
LSOBypass_CFLAGS = -fobjc-arc

# Các lệnh mặc định của Theos
include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

# Lệnh sau khi cài đặt (tùy chọn)
after-install::
	install.exec "killall -9 SpringBoard"
