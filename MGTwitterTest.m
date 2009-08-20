#import "MGTwitterTest.h"
#import "MGTwitterEngine.h"
#import "TwitterEngineDelegate.h"

@implementation MGTwitterTest

-(void) testMGTwitterEngine
{
	MGTwitterEngine *twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:[[TwitterEngineDelegate alloc] init]];
	[twitterEngine setUsername:@"tddoniphone" password:@"daledaledale"];
	
	// Get updates from people the authenticated user follows.
	NSLog(@"About to try to get timeline");
	NSString *connectionID = [twitterEngine getFollowedTimelineFor:@"tddoniphone" since:nil startingAtPage:0];
	NSLog(connectionID);
	NSLog(@"Got Timeline");
}

@end
