#import "TwitterConnection.h"

@implementation TwitterConnection

@synthesize delegate;

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
@end
