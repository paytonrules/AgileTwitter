#import "TwitterDataSource.h"
#import "TwitterDataSourceTest.h"
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
//- (void) testCellZeroReturnsCellWithZero
//{
//	NSIndexPath *path = [NSIndexPath indexPathWithIndex:0];
//	UITableViewCell *cell = [twitterDataSource tableView: nil cellForRowAtIndexPath:path];
//
//	STAssertEqualStrings(@"Zero", cell.textLabel.text, nil);
//}


@end
