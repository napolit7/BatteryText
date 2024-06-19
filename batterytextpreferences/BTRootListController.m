#import <Cephei/HBPreferences.h>
#import <Preferences/PSSpecifier.h>
#import "BTRootListController.h"

@implementation BTRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
