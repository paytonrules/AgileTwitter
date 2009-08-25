#import "ListTweetsViewControllerTest.h"
#import "ListTweetsViewCOntroller.h"
#import "TwitterDataSource.h"
#import <OCMock/OCMock.h>

@implementation ListTweetsViewControllerTest

-(void) setUp
{
	viewController = [[ListTweetsViewController alloc] init];
}

-(void) tearDown
{
	[viewController release];
}

-(void) testDataSourceIsLoadedOnViewDidLoad
{
	OCMockObject *mockDataSource = [OCMockObject mockForClass:[TwitterDataSource class]];
	viewController.twitterDataSource = (TwitterDataSource *)mockDataSource;
	
	[[mockDataSource expect] refresh];
	
	[viewController viewDidLoad];
	
	[mockDataSource verify];
}

-(void) testReturnsHeightValueForACell
{
	STAssertEquals((CGFloat)kRowHeight, [viewController tableView:nil heightForRowAtIndexPath:nil], nil);
}

-(void) testRefreshRefreshesTheDataSource
{
	OCMockObject *mockDataSource = [OCMockObject niceMockForClass:[TwitterDataSource class]];
	viewController.twitterDataSource = (TwitterDataSource *)mockDataSource;
	
	[[mockDataSource expect] refresh];
	
	[viewController refresh];
	
	[mockDataSource verify];
}
@end
