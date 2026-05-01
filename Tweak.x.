#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Khai báo cấu trúc Menu mượn từ thư viện Eww
@interface EwwMenu : NSObject
+(void)setTitle:(NSString *)title;
+(void)addSwitch:(NSString *)title :(void(^)(BOOL value))block;
@end

struct {
    BOOL BypassMic;
    BOOL AntiMute;
} _G;

// Khởi tạo Menu
static __attribute__((constructor)) void setupMenu() {
    [EwwMenu setTitle:@"Eww V1 | WEREWOLF VOICE"];
    [EwwMenu addSwitch:@"Bypass Mic (Talk when dead)" :^(BOOL value) {
        _G.BypassMic = value;
    }];
    [EwwMenu addSwitch:@"Anti-Mute" :^(BOOL value) {
        _G.AntiMute = value;
    }];
}

// Hook logic game
bool (*old_IsMuted)(void *instance);
bool new_IsMuted(void *instance) {
    if (_G.BypassMic) return false; 
    return old_IsMuted(instance);
}

bool (*old_IsPlayerDead)(void *instance) ;
bool new_IsPlayerDead(void *instance) {
    if (_G.BypassMic) return false;
    return old_IsPlayerDead(instance);
}
