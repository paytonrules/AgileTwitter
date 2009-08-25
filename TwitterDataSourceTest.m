#import "TwitterDataSource.h"
#import "TwitterDataSourceTest.h"
#import "TwitterConnection.h"
#import "TwitterStatusCell.h"
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

-(UITableView *)mockTableView
{
	return (UITableView *)[OCMockObject niceMockForClass:[UITableView class]];
}

-(void) setupMockTwitterConnection
{
	twitterConnection = [OCMockObject mockForClass:[TwitterConnection class]];
	twitterDataSource.twitterConnection  = (TwitterConnection *)twitterConnection;
}

-(void) testCellTriesForReusableCellsFirst
{
	OCMockObject *tableView = [OCMockObject niceMockForClass:[UITableView class]];
	OCMockObject *mockCell = [OCMockObject niceMockForClass:[UITableViewCell class]];
	[[[tableView stub] andReturn: mockCell] dequeueReusableCellWithIdentifier:@"TwitterCellIdentifier"];
	
	TwitterStatusCell *cell = (TwitterStatusCell *)[twitterDataSource tableView: (UITableView *)tableView cellForRowAtIndexPath:nil];
	STAssertEqualObjects(cell, mockCell, nil);
}

-(void) testCellIsCreatedFromNibIfThereIsNoReusableCell
{
	OCMockObject *tableView = [OCMockObject niceMockForClass:[UITableView class]];
	[[[tableView stub] andReturn: nil] dequeueReusableCellWithIdentifier:@"TwitterCellIdentifier"];
	
	TwitterStatusCell *cell = (TwitterStatusCell *)[twitterDataSource tableView: (UITableView *)tableView cellForRowAtIndexPath:nil];
	
	STAssertEqualStrings(@"TwitterCellIdentifier", cell.reuseIdentifier, nil);
}

-(void) testCallsRefreshOnTwitterConnection
{
	[self setupMockTwitterConnection];

	[[twitterConnection expect] refresh];
	
	[twitterDataSource refresh];
	
	[twitterConnection verify];
}

-(void) testWhenStatusesAreReceivedRefreshTheTableView
{
	OCMockObject *tableView = [OCMockObject mockForClass:[UITableView class]];
	twitterDataSource.tableView = (UITableView *)tableView;
	[[tableView expect] reloadData];
	
	[twitterDataSource statusesReceived:nil forRequest:nil];
	
	[tableView verify];
}

-(void) testBuildsATableCellForTheStatus
{
	OCMockObject *tableView = [OCMockObject niceMockForClass:[UITableView class]];
	NSDictionary *status = [NSDictionary dictionaryWithObject:@"I am a tweet!" forKey:@"text"];
	NSArray *array = [NSArray arrayWithObject:status];
	
	[twitterDataSource statusesReceived:array forRequest:nil];
	
	TwitterStatusCell *cell = (TwitterStatusCell *)[twitterDataSource tableView:(UITableView *)tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	STAssertEqualStrings(cell.tweet.text, @"I am a tweet!", nil);
}

-(void) testBuildsACellForAllTheStatuses
{
	OCMockObject *tableView = [OCMockObject niceMockForClass:[UITableView class]];
	NSDictionary *status1 = [NSDictionary dictionaryWithObject:@"I am a tweet!" forKey:@"text"];
	NSDictionary *status2 = [NSDictionary dictionaryWithObject:@"I am also a tweet!" forKey:@"text"];
	NSArray *array = [NSArray arrayWithObjects:status1, status2, nil];

	[twitterDataSource statusesReceived:array forRequest:nil];
	
	TwitterStatusCell *cell = (TwitterStatusCell *)[twitterDataSource tableView:(UITableView *)tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
	STAssertEqualStrings(cell.tweet.text, @"I am also a tweet!", nil);
}

-(void) testReturnsTheNumberOfTweets
{
	OCMockObject *tableView = [OCMockObject niceMockForClass:[UITableView class]];
	NSDictionary *status1 = [NSDictionary dictionaryWithObject:@"I am a tweet!" forKey:@"text"];
	NSDictionary *status2 = [NSDictionary dictionaryWithObject:@"I am also a tweet!" forKey:@"text"];
	NSArray *array = [NSArray arrayWithObjects:status1, status2, nil];
	
	[twitterDataSource statusesReceived:array forRequest:nil];
	
	STAssertEquals(2, [twitterDataSource tableView:(UITableView *)tableView numberOfRowsInSection:0], nil);
}

-(void) testDisplaysScreenName
{
	NSDictionary *user = [NSDictionary dictionaryWithObject:@"agile_2009" forKey: @"screen_name"];
	NSDictionary *status = [NSDictionary dictionaryWithObject:user forKey: @"user"];
	NSArray *array = [NSArray arrayWithObject:status];
	
	[twitterDataSource statusesReceived:array forRequest:nil];
	TwitterStatusCell *cell = (TwitterStatusCell *)[twitterDataSource tableView:[self mockTableView] cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	
	STAssertEqualStrings(@"agile_2009", cell.username.text, nil);
}

@end
