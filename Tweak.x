#import <Foundation/Foundation.h>
#import <Cephei/HBPreferences.h>
#import "Themes.h"

HBPreferences *preferences = nil;
BOOL enabled = YES;
BOOL useText = NO;
NSString *batteryText = @"";
NSInteger theme = 0;

%hook STBatteryStatusDomainData

- (instancetype)initWithChargingState:(int)chargingState 
                        percentCharge:(int)percentCharge 
              batterySaverModeActive:(BOOL)batterySaverModeActive 
                 chargingDescription:(NSString *)chargingDescription 
           chargingDescriptionType:(int)chargingDescriptionType {

    if (enabled) {
        if (useText) {
            chargingDescription = batteryText;
        } else {
            NSString *(*chosenTheme)(int) = [themes[theme] pointerValue];
            chargingDescription = chosenTheme(percentCharge);
        }
    }

	return %orig(chargingState, percentCharge, batterySaverModeActive, chargingDescription, chargingDescriptionType);
}

%end

static void preferencesChanged(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    enabled = [preferences boolForKey:@"toggleSwitch"];
    batteryText = [preferences objectForKey:@"batteryText"];
    useText = [preferences boolForKey:@"customTextSwitch"];
    theme = [preferences integerForKey:@"selectedTheme"];
}

%ctor {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.napolit7.BatteryTextPreferences"];

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesChanged, CFSTR("com.napolit7.BatteryTextPreferences/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    preferencesChanged(NULL, NULL, NULL, NULL, NULL);
}