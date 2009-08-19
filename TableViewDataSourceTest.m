#import "TableViewDataSource.h"
#import "TableViewDataSourceTest.h"

@implementation TableViewDataSourceTest

-(void) setUp
{
	delegate = [[TableViewDataSource alloc] init];
}

-(void) tearDown
{
	[delegate release];
}

- (void) testReturnsTenForNumberOfRowsInSection 
{
	STAssertEquals(10, [delegate tableView: nil numberOfRowsInSection: 1], nil);  
}

- (void) testCellZeroReturnsCellWithZero
{
	NSIndexPath *path = [NSIndexPath indexPathWithIndex:0];
	UITableViewCell *cell = [delegate tableView: nil cellForRowAtIndexPath:path];

	STAssertEquals(@"Zero", cell.textLabel, nil);
}


@end
