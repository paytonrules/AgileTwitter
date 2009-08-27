#import "GTMSenTestCase.h"
#import "MGTwitterConnection.h"

@interface MGTwitterConnectionWithRealEngineTest : GTMTestCase
{
	bool requestFailedReceived;
	MGTwitterConnection *twitterConnection;

}
@end
