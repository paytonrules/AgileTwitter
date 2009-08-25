#import "TwitterConnection.h"
#import "ConcreteTwitterEngineFactory.h"

@implementation TwitterConnection

@synthesize twitterEngineFactory, delegate, twitterEngine;

- (id)init
{
	if (self = [super init] )
	{
		twitterEngineFactory = [[ConcreteTwitterEngineFactory alloc] init];
		twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:self];
	}
	return self;
}

- (void)tweet:(NSString *)message
{
	[twitterEngine sendUpdate:message];
}

- (void)refresh
{	
	[twitterEngine getFollowedTimelineFor:[twitterEngine username] since:nil startingAtPage:0];
}

- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier
{
	if ([delegate respondsToSelector:@selector(statusesReceived:forRequest:)])
	{
		[delegate statusesReceived:statuses forRequest:identifier];
	}
}

- (void)requestSucceeded:(NSString *)requestIdentifier
{
}

- (void)requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
	[delegate requestFailed:nil withError:nil];
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
	[twitterEngine release];
	[delegate release];
	[super dealloc];
}

@end
