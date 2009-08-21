#import "AgileTwitterViewControlllerTest.h"
#import "AgileTwitterViewController.h"
#import "TwitterDataSource.h"
#import <OCMock/OCMock.h>

@implementation AgileTwitterViewControlllerTest

-(void) testDataSourceIsLoadedOnViewDidLoad
{
	OCMockObject *mockDataSource = [OCMockObject mockForClass:[TwitterDataSource class]];
	AgileTwitterViewController *viewController = [[AgileTwitterViewController alloc] init];
	viewController.twitterDataSource = (TwitterDataSource *)mockDataSource;
	
	[[mockDataSource expect] getFollowedTimelineSince:nil startingAtPage:0];
	
	[viewController viewDidLoad];
	
	[mockDataSource verify];
}


@end
