#import "ComposeTweetViewControllerTest.h"
#import "ComposeTweetViewController.h"
#import "TwitterConnection.h"
#import <OCMock/OCMock.h>

@implementation ComposeTweetViewControllerTest

- (void)setUp
{
	viewController = [[ComposeTweetViewController alloc] init];
}

- (void)tearDown
{
	[viewController release];
}

- (void)testViewControllerSetsTextViewToFirstResponder
{
	OCMockObject *textView = [OCMockObject niceMockForClass:[UITextView class]];
	viewController.textView = (UITextView *)textView;
	
	[[textView expect] becomeFirstResponder];
	
	[viewController viewDidAppear:NO];
	
	[textView verify];
}

- (void)testSendButtonSendsTweet
{
	viewController.textView = [[[UITextView alloc] init] autorelease];
	viewController.textView.text = @"This is my tweet";
	
	OCMockObject *twitterConnection = [OCMockObject mockForClass:[TwitterConnection class]];
	viewController.twitterConnection = (TwitterConnection *)twitterConnection;
	
	[[twitterConnection expect] tweet:@"This is my tweet"];
	
	[viewController tweet];
	
	[twitterConnection verify];
}

@end
