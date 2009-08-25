#import "TwitterConnection.h"

@implementation TwitterConnection

@synthesize twitterEngineFactory;

- (void)tweet:(NSString *)message
{
	MGTwitterEngine *engine = [twitterEngineFactory createWithDelegate:self];
	
	[engine sendUpdate:message];
}

- (void)refresh
{	
	MGTwitterEngine *engine = [twitterEngineFactory createWithDelegate:self];
	
	[engine getFollowedTimelineFor:[engine username] since:nil startingAtPage:0];
}

// Delegate Methods (callbacks) from MGTwitterEngines
- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier
{
}

- (void)requestSucceeded:(NSString *)requestIdentifier
{
}

- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
}

- (void)directMessagesReceived:(NSArray *)messages forRequest:(NSString *)identifier
{
}

- (void)userInfoReceived:(NSArray *)userInfo forRequest:(NSString *)identifier
{
}

- (void)miscInfoReceived:(NSArray *)miscInfo forRequest:(NSString *)identifier
{
}

- (void)imageReceived:(UIImage *)image forRequest:(NSString *)identifier
{
}	

- (void)dealloc
{
	[twitterEngineFactory release];
	[super dealloc];
}

@end
