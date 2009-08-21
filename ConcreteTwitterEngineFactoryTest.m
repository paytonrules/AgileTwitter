#import "ConcreteTwitterEngineFactoryTest.h"
#import "TwitterEngineFactory.h"
#import "ConcreteTwitterEngineFactory.h"
#import "MGTwitterEngineDelegate.h"
#import <OCMock/OCMock.h>

@implementation ConcreteTwitterEngineFactoryTest

-(void) setUp
{
	factory = [[ConcreteTwitterEngineFactory alloc] init];
}

-(void) tearDown
{
	[factory release];
}

-(void) testConcreteTwitterEngineFactoryReturnsCorrectEngine
{
	OCMockObject *delegate = [OCMockObject mockForProtocol:@protocol(MGTwitterEngineDelegate)];
	
	MGTwitterEngine *twitterEngine = [factory createWithDelegate:(NSObject<MGTwitterEngineDelegate> *)delegate];
	
	// A little indirect - I can't get the actual delegate to check it was set properly - but I CAN test that it gets
	// forwarded events
	[[delegate expect] requestFailed:@"fakeID" withError:nil];
	
	[twitterEngine parsingFailedForRequest:@"fakeID" ofResponseType:MGTwitterStatusesRequest withError:nil];
	
	[delegate verify];
}

-(void) testTwitterEngineHasUsernameAndPassword
{
	MGTwitterEngine *twitterEngine = [factory createWithDelegate:nil];
	
	STAssertEqualStrings(@"tddoniphone", [twitterEngine username], nil);
	STAssertEqualStrings(@"daledaledale", [twitterEngine password], nil);
}
@end
