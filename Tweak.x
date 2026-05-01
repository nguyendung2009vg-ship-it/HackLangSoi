#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <substrate.h>

// --- ĐỊNH NGHĨA MENU (KHÔNG THỂ THIẾU PHẦN IMPLEMENTATION) ---
@interface EwwMenu : UIView
+(void)setTitle:(NSString *)title;
+(void)addSwitch:(NSString *)title :(void(^)(BOOL value))block;
@end

@implementation EwwMenu
// Phải có 2 dòng này thì máy mới không báo lỗi "Undefined"
+(void)setTitle:(NSString *)title {}
+(void)addSwitch:(NSString *)title :(void(^)(BOOL value))block {}
@end

// --- LOGIC ---
struct {
    BOOL BypassMic;
} _G;

bool (*old_IsMuted)(void *instance);
bool new_IsMuted(void *instance) {
    if (_G.BypassMic) return false; 
    return old_IsMuted(instance);
}

static __attribute__((constructor)) void init() {
    [EwwMenu setTitle:@"DUNG X V2"];
    [EwwMenu addSwitch:@"Bypass Mic" :^(BOOL value) {
        _G.BypassMic = value;
    }];
    
    // Nếu có offset thật thì thay vào đây, không thì cứ để nó biên dịch trước đã
    // MSHookFunction((void*)((unsigned long)NULL + 0x123456), (void*)new_IsMuted, (void**)&old_IsMuted);
}
