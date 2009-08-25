#import "GTMSenTestCase.h"
#import "TwitterConnection.h"

@interface TwitterConnectionWithRealEngineTest : GTMTestCase
{
	bool requestFailedReceived;
	TwitterConnection *twitterConnection;

}
@end
