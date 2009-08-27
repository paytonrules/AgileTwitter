#import "GTMSenTestCase.h"
#import "MGTwitterConnection.h"
#import "MGTwitterEngine.h"
#import <OCMock/OCMock.h>

@interface MGTwitterConnectionTest : GTMTestCase 
{
	MGTwitterConnection *twitterConnection;
	OCMockObject			*twitterEngine;
	bool							statusesReceived;
	bool							requestFailedReceived;
	NSArray						*statuses;
	NSString					*requestId;
	NSString					*requestFailedId;
	NSError						*requestFailedError;
}
@end
