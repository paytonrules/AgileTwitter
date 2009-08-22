#import "AgileTwitterViewControlllerTest.h"
#import "AgileTwitterViewController.h"
#import "TwitterDataSource.h"
#import <OCMock/OCMock.h>

@implementation AgileTwitterViewControlllerTest

-(void) setUp
{
	viewController = [[AgileTwitterViewController alloc] init];
}

-(void) tearDown
{
	[viewController release];
}

-(void) testDataSourceIsLoadedOnViewDidLoad
{
	OCMockObject *mockDataSource = [OCMockObject mockForClass:[TwitterDataSource class]];
	viewController.twitterDataSource = (TwitterDataSource *)mockDataSource;
	
	[[mockDataSource expect] getFollowedTimelineSince:nil startingAtPage:0];
	
	[viewController viewDidLoad];
	
	[mockDataSource verify];
}

-(void) testReturnsHeightValueForACell
{
	STAssertEquals((CGFloat)kRowHeight, [viewController tableView:nil heightForRowAtIndexPath:nil], nil);
}
@end
