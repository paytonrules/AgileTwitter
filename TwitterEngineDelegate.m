#import "TwitterEngineDelegate.h"

@implementation TwitterEngineDelegate

-(void) requestSucceeded:(NSString *)requestIdentifier
{
	NSLog(@"I get here - request Succeeded");
}

-(void) requestFailed:(NSString *)requestIdentifier withError:(NSError *)error
{
	NSLog(@"I get here - request Failed");
}

-(void) statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier
{
	NSLog(@"I get here");
	NSEnumerator *enumerator = [statuses objectEnumerator];
	id anObject;
	
	while (anObject = [enumerator nextObject]) {
		NSLog([anObject description]);
	}
}

-(void) directMessagesReceived:(NSArray *)messages forRequest:(NSString *)identifier
{
	NSLog(@"directMessagesReceived");
}

-(void) userInfoReceived:(NSArray *)userInfo forRequest:(NSString *)identifier
{
	NSLog(@"userInfoReceived");
}

-(void) miscInfoReceived:(NSArray *)miscInfo forRequest:(NSString *)identifier
{
	NSLog(@"miscInfoReceived");
}

-(void) imageReceived:(UIImage *)image forRequest:(NSString *)identifier
{
	NSLog(@"imageReceived");
}

@end
