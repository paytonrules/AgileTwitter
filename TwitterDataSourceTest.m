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

-(void) setupMockTwitterEngine
{
	twitterEngine = [OCMockObject mockForClass:[MGTwitterEngine class]];
	[[[twitterEngine stub] andReturn:@"Username"] username];
	twitterEngineFactory = [OCMockObject mockForProtocol:@protocol(TwitterEngineFactory)];
	twitterDataSource.twitterEngineFactory = (NSObject *)twitterEngineFactory;
	[[[twitterEngineFactory stub] andReturn: twitterEngine] createWithDelegate: OCMOCK_ANY];
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
	
	STAssertEqualStrings(@"TwitterCellIdentifier", cell.reuseIdentifier, nil);
}

-(void) testCreatesTheTwitterEngineToMakeACall
{
	twitterEngineFactory = [OCMockObject mockForProtocol:@protocol(TwitterEngineFactory)];
	twitterDataSource.twitterEngineFactory = (NSObject *)twitterEngineFactory;

	[[twitterEngineFactory expect] createWithDelegate: twitterDataSource];
	
	[twitterDataSource getFollowedTimelineSince:nil startingAtPage:0];
	
	[twitterEngineFactory verify];
}

-(void) testCallsGetFollowedTimeLineOnTwitterEngine
{
	[self setupMockTwitterEngine];

	NSDate *date = [NSDate date];
	[[twitterEngine expect] getFollowedTimelineFor:@"Username" since:date startingAtPage:1];
	
	[twitterDataSource getFollowedTimelineSince:date startingAtPage:1];
	
	[twitterEngine verify];
}

-(void) testGetFollowedTimeLineReturnsTheConnectionIdFromTheDataSource
{
	[self setupMockTwitterEngine];
	[[[twitterEngine stub] andReturn: @"ConnectionID"] getFollowedTimelineFor:OCMOCK_ANY since:OCMOCK_ANY startingAtPage:0];
	
	STAssertEqualStrings(@"ConnectionID", [twitterDataSource getFollowedTimelineSince:nil startingAtPage:0], nil);
}

@end
