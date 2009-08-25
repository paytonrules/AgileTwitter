#import "TwitterConnectionTest.h"
#import "ConcreteTwitterEngineFactory.h"

@implementation TwitterConnectionTest

- (void)statusesReceived:(NSArray *)newStatuses forRequest:(NSString *)identifier
{
	statusesReceived = true;
}

- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
	requestFailedReceived = true;
}

- (void)setUp
{
	twitterConnection = [[TwitterConnection alloc] init];
	
	twitterEngine = [OCMockObject niceMockForClass:[MGTwitterEngine class]];
	twitterConnection.twitterEngine = (MGTwitterEngine *)twitterEngine;
	twitterConnection.twitterEngineFactory = (NSObject *)twitterEngineFactory;
}

- (void)tearDown
{
	[twitterConnection release];
}

- (void)testSendsTweetThroughTwitterEngine
{
	[[twitterEngine expect] sendUpdate:@"Tweet"];
	
	[twitterConnection tweet:@"Tweet"];
	
	[twitterEngine verify];
}

- (void)testRefreshRetrievesAllTweets
{
	[[[twitterEngine stub] andReturn:@"username"] username];
	[[twitterEngine expect] getFollowedTimelineFor:@"username" since:nil startingAtPage:0];
	
	[twitterConnection refresh];
	
	[twitterEngine verify];
}

- (void)testStartsWithAConcreteTwitterFactory
{
	TwitterConnection *myTwitterConnection = [[[TwitterConnection alloc] init] autorelease];
	
	STAssertTrue([myTwitterConnection.twitterEngineFactory isKindOfClass:[ConcreteTwitterEngineFactory class]], nil);
}

- (void)testForwardsOnStatusesReceivedIfItsDelegateResponds
{
	statusesReceived = false;
	twitterConnection.delegate = self;
	
	[twitterConnection statusesReceived:nil forRequest:nil];
	
	STAssertTrue(statusesReceived, nil);
}

- (void)testDoesNotCrashWhenThereIsNotADelegate
{
	statusesReceived = false;
	
	STAssertNoThrow([twitterConnection statusesReceived:nil forRequest:nil], nil);
	STAssertFalse(statusesReceived, nil);
}

- (void)testDoesNotCrashWhenTheDelegateDoesNotHaveTheMethod
{
	NSObject *object = [[NSObject alloc] init];
	twitterConnection.delegate = object;
	[object release];
	
	STAssertNoThrow([twitterConnection statusesReceived:nil forRequest:nil], nil);
}

@end
