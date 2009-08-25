#import "TwitterConnectionWithRealEngineTest.h"
#import "TwitterConnection.h"

@implementation TwitterConnectionWithRealEngineTest

- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
	requestFailedReceived = true;
}

- (void)testSetsTheMGEngineDelegateToSelf
{
	TwitterConnection *twitterConnection = [[[TwitterConnection alloc] init] autorelease];
	requestFailedReceived = false;
	twitterConnection.delegate = self;
	
	[twitterConnection.twitterEngine parsingFailedForRequest:nil ofResponseType:MGTwitterGeneric withError:nil];
	
	STAssertTrue(requestFailedReceived, nil);
}

@end
