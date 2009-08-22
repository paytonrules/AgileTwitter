#import "AgileTwitterAppDelegateTest.h"
#import "AgileTwitterAppDelegate.h"
#import <OCMock/OCMock.h>

@implementation AgileTwitterAppDelegateTest

- (void)testAppDelegateLoadsTheNavigationController
{
	UIWindow *window = [[[UIWindow alloc] init] autorelease];
	UINavigationController *navigationController = [[[UINavigationController alloc] init] autorelease];
	AgileTwitterAppDelegate *delegate = [[[AgileTwitterAppDelegate alloc] init] autorelease];
	delegate.navigationController = navigationController;
	delegate.window = window;
	
	[delegate applicationDidFinishLaunching:nil];
	
	STAssertTrue([delegate.window.subviews containsObject:navigationController.view], @"The window should contain the navigation controller view as a subview");
}

@end
