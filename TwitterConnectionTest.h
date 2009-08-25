#import "GTMSenTestCase.h"
#import "TwitterConnection.h"
#import "MGTwitterEngine.h"
#import <OCMock/OCMock.h>

@interface TwitterConnectionTest : GTMTestCase 
{
	TwitterConnection *twitterConnection;
	OCMockObject			*twitterEngine;
	bool							statusesReceived;
	bool							requestFailedReceived;
	NSArray						*statuses;
	NSString					*requestId;
	NSString					*requestFailedId;
	NSError						*requestFailedError;
}
@end
