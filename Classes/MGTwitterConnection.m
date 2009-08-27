#import "MGTwitterConnection.h"

@implementation MGTwitterConnection

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

- (void)dealloc
{
	[twitterEngine release];
	[delegate release];
	[super dealloc];
}

@end
