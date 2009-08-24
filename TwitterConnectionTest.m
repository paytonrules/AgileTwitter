#import "TwitterConnectionTest.h"
#import "TwitterConnection.h"
#import "MGTwitterEngine.h"
#import <OCMock/OCMock.h>

@implementation TwitterConnectionTest

- (void) testSendsTweetThroughTwitterEngine
{
	OCMockObject *twitterEngine = [OCMockObject mockForClass:[MGTwitterEngine class]];
	TwitterConnection *twitterConnection = [[[TwitterConnection alloc] init] autorelease];
	twitterConnection.twitterEngine = (MGTwitterEngine *)twitterEngine;
//	twitterConnection
	
	//STAssertTrue((1+1)==3, @"Compiler isn't feeling well today :-(" );  
}


@end
