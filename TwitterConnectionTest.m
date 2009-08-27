#import "TwitterConnectionTest.h"
#import "MGTwitterEngine.h"

@implementation TwitterConnectionTest

- (void)statusesReceived:(NSArray *)newStatuses forRequest:(NSString *)identifier
{
	statusesReceived = true;
	statuses = [NSArray arrayWithArray:newStatuses];
	requestId = identifier;
}

- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
	requestFailedReceived = true;
	requestFailedId = requestIdentifier;
	requestFailedError = error;
}

- (void)setUp
{
	twitterConnection = [[TwitterConnection alloc] init];
	
	twitterEngine = [OCMockObject niceMockForClass:[MGTwitterEngine class]];
	twitterConnection.twitterEngine = (MGTwitterEngine *)twitterEngine;
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

- (void)testForwardsOnStatusesReceivedIfItsDelegateResponds
{
	statusesReceived = false;
	twitterConnection.delegate = self;
	NSArray *theStatuses = [NSArray arrayWithObject:@"Object"];
	
	[twitterConnection statusesReceived:theStatuses forRequest:@"Request"];
	
	STAssertTrue(statusesReceived, nil);
	STAssertEqualObjects(theStatuses, statuses, nil);
	STAssertEqualStrings(@"Request", requestId, nil);
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

- (void)testRequestFailedForwardsOnCall
{
	requestFailedReceived = false;
	twitterConnection.delegate = self;
	
	NSError *error = [[[NSError alloc] init] autorelease];
	[twitterConnection requestFailed:@"ID" withError:error];
	
	STAssertTrue(requestFailedReceived, nil);
	STAssertEqualStrings(@"ID", requestFailedId, nil);
	STAssertEqualObjects(error, requestFailedError, nil);
}

- (void)testRequestDoesNotCrashWhenTheDelegateDoesNotHaveRequestFailed
{
	NSObject *object = [[NSObject alloc] init];
	twitterConnection.delegate = object;
	[object release];
	
	STAssertNoThrow([twitterConnection requestFailed:nil withError:nil], nil);
} 


@end
