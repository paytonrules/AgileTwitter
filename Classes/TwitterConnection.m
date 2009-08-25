#import "TwitterConnection.h"

@implementation TwitterConnection

@synthesize delegate, twitterEngine;

- (id)init
{
	if (self = [super init] )
	{
		twitterEngine = [[MGTwitterEngine alloc] initWithDelegate:self];
		[twitterEngine setUsername:@"tddoniphone" password:@"daledaledale"];
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
	if ([delegate respondsToSelector:@selector(requestFailed:withError:)])
	{
		[delegate requestFailed:requestIdentifier withError:error];
	}
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
	[twitterEngine release];
	[delegate release];
	[super dealloc];
}

@end
