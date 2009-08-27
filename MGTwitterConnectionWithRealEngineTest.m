#import "MGTwitterConnectionWithRealEngineTest.h"
@implementation MGTwitterConnectionWithRealEngineTest

- (void)setUp
{
	twitterConnection = [[MGTwitterConnection alloc] init];
}

- (void)tearDown
{
	[twitterConnection release];
}

- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
	requestFailedReceived = true;
}

- (void)testSetsTheMGEngineDelegateToSelf
{
	requestFailedReceived = false;
	twitterConnection.delegate = self;
	
	[twitterConnection.twitterEngine parsingFailedForRequest:nil ofResponseType:MGTwitterGeneric withError:nil];
	
	STAssertTrue(requestFailedReceived, nil);
}

- (void)testSetsTheUserNameAndPasswordForTheEngine
{
	STAssertEqualStrings(@"tddoniphone", [twitterConnection.twitterEngine username], nil);
	STAssertEqualStrings(@"daledaledale", [twitterConnection.twitterEngine password], nil);
}
	

@end
