#import "TwitterConnectionTest.h"

@implementation TwitterConnectionTest

- (void)setUp
{
	twitterConnection = [[TwitterConnection alloc] init];
	
	twitterEngine = [OCMockObject mockForClass:[MGTwitterEngine class]];
	[[[twitterEngine stub] andReturn:@"username"] username];
	twitterEngineFactory = [OCMockObject mockForProtocol:@protocol(TwitterEngineFactory)];
	[[[twitterEngineFactory stub] andReturn: twitterEngine] createWithDelegate: OCMOCK_ANY];
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

@end
