#import "TwitterStatusCellTest.h"
#import "TwitterStatusCell.h"

@implementation TwitterStatusCellTest

- (void)setUp
{
	cell = [[TwitterStatusCell alloc] init];
}

- (void)tearDown
{
	[cell release];
}

- (void)testSetAndGetUserNameAndTweetForMemoryLeaks
{
	cell.username = [[UILabel alloc] init];
	cell.tweet = [[UILabel alloc] init];
	
	cell.username.text = @"Monkey";
	cell.tweet.text = @"My first Monkey Tweet";
	
	STAssertEqualStrings(@"Monkey", cell.username.text, nil);
	STAssertEqualStrings(@"My first Monkey Tweet", cell.tweet.text, nil);
}

@end
