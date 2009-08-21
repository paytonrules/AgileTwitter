#import "TwitterDataSource.h"
#import "TwitterDataSourceTest.h"
#import "TwitterEngineFactory.h"
#import "MGTwitterEngine.h"
#import <OCMock/OCMock.h>

@implementation TwitterDataSourceTest

-(void) setUp
{
	twitterDataSource = [[TwitterDataSource alloc] init];
}

-(void) tearDown
{
	[twitterDataSource release];
}

-(void) testCellTriesForReusableCellsFirst
{	
	OCMockObject *tableView = [OCMockObject niceMockForClass:[UITableView class]];
	OCMockObject *mockCell = [OCMockObject niceMockForClass:[UITableViewCell class]];
	[[[tableView stub] andReturn: mockCell] dequeueReusableCellWithIdentifier:@"TwitterCellIdentifier"];
	
	UITableViewCell *cell = [twitterDataSource tableView: (UITableView *)tableView cellForRowAtIndexPath:nil];
	STAssertEqualObjects(cell, mockCell, nil);
}

-(void) testCellIsCreatedIfThereIsNoReusableCell
{
	OCMockObject *tableView = [OCMockObject niceMockForClass:[UITableView class]];
	[[[tableView stub] andReturn: nil] dequeueReusableCellWithIdentifier:@"TwitterCellIdentifier"];
	
	UITableViewCell *cell = [twitterDataSource tableView: (UITableView *)tableView cellForRowAtIndexPath:nil];
	
	STAssertNotNil(cell, nil);
	STAssertEqualStrings(@"TwitterCellIdentifier", cell.reuseIdentifier, nil);
}

-(void) testCreatesTheTwitterEngineToMakeACall
{
	OCMockObject *twitterEngineFactory = [OCMockObject mockForProtocol:@protocol(TwitterEngineFactory)];
	twitterDataSource.twitterEngineFactory = (NSObject *)twitterEngineFactory;

	[[twitterEngineFactory expect] create];
	
	[twitterDataSource getFollowedTimelineFor:nil since:nil startingAtPage:0];
	
	[twitterEngineFactory verify];
}

-(void) testCallsGetFollowedTimeLineOnTwitterEngine
{
	OCMockObject *twitterEngine = [OCMockObject mockForClass:[MGTwitterEngine class]];
	OCMockObject *twitterEngineFactory = [OCMockObject mockForProtocol:@protocol(TwitterEngineFactory)];
	twitterDataSource.twitterEngineFactory = (NSObject *)twitterEngineFactory;
	[[[twitterEngineFactory stub] andReturn: twitterEngine] create];

	NSDate *date = [NSDate date];
	[[twitterEngine expect] getFollowedTimelineFor:@"Username" since:date startingAtPage:1];
	
	[twitterDataSource getFollowedTimelineFor:@"Username" since:date startingAtPage:1];
	
	[twitterEngine verify];
}

-(void) testGetFollowedTimeLineReturnsTheConnectionIdFromTheDataSource
{
	OCMockObject *twitterEngine = [OCMockObject mockForClass:[MGTwitterEngine class]];
	OCMockObject *twitterEngineFactory = [OCMockObject mockForProtocol:@protocol(TwitterEngineFactory)];
	twitterDataSource.twitterEngineFactory = (NSObject *)twitterEngineFactory;
	[[[twitterEngineFactory stub] andReturn: twitterEngine] create];
	
	[[[twitterEngine stub] andReturn: @"ConnectionID"] getFollowedTimelineFor:OCMOCK_ANY since:OCMOCK_ANY startingAtPage:0];
	
	STAssertEqualStrings(@"ConnectionID", [twitterDataSource getFollowedTimelineFor:nil since:nil startingAtPage:0], nil);
}
	
	

//-(void) testOnlyCreatesTheTwitterEngineOnce
//{
//	OCMockObject *twitterEngineFactory = [OCMockObject mockForProtocol:@protocol(TwitterEngineFactory)];
//	twitterDataSource.twitterEngineFactory = (NSObject *)twitterEngineFactory;
//	
//	[[twitterEngineFactory expect] create];
//	
//	[twitterDataSource getFollowedTimelineFor:nil since:nil startingAtPage:0];
//	[twitterDataSource getFollowedTimelineFor:nil since:nil startingAtPage:0];
//	
//	[twitterEngineFactory verify];
//}

	

@end
