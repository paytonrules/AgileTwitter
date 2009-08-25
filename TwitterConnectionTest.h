#import "GTMSenTestCase.h"
#import "TwitterConnection.h"
#import "MGTwitterEngine.h"
#import <OCMock/OCMock.h>

@interface TwitterConnectionTest : GTMTestCase 
{
	TwitterConnection *twitterConnection;
	OCMockObject *twitterEngineFactory;
	OCMockObject *twitterEngine;
}
@end
