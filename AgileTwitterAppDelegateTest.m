#import "AgileTwitterAppDelegateTest.h"
#import <OCMock/OCMock.h>

@implementation AgileTwitterAppDelegateTest

- (void)setUp
{
	UIWindow *window = [[[UIWindow alloc] init] autorelease];
	navigationController = [[[UINavigationController alloc] init] autorelease];
	delegate = [[[AgileTwitterAppDelegate alloc] init] autorelease];
	delegate.navigationController = navigationController;
	delegate.window = window;	
}

- (void)testAppDelegateLoadsTheNavigationController
{
	[delegate applicationDidFinishLaunching:nil];
	
	STAssertTrue([delegate.window.subviews containsObject:navigationController.view], @"The window should contain the navigation controller view as a subview");
}

- (void)testComposeActionLoadsComposeController
{
	OCMockObject *mockNavigator = [OCMockObject mockForClass:[UINavigationController class]];
	delegate.navigationController = (UINavigationController *)mockNavigator;
	
	[[mockNavigator expect] pushViewController:[OCMArg any] animated: YES];
	
	[delegate compose];
	
	[mockNavigator verify];
}

- (void)testComposePushesTheComposeTweetViewOntoTheStack
{
	UIViewController *composeTweetController = [[[UIViewController alloc] init] autorelease];
	delegate.composeTweetController = composeTweetController;
	
	[delegate compose];
	
	STAssertEqualObjects(delegate.navigationController.visibleViewController, composeTweetController, nil);
}

- (void)testDoneComposingPopsTheComposeTweetViewOffTheStack
{
	[delegate compose];
	
	[delegate doneComposing];
	
	STAssertNil(delegate.navigationController.visibleViewController, nil);
}

@end
