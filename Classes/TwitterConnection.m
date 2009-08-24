#import "TwitterConnection.h"

@implementation TwitterConnection

@synthesize twitterEngine;

- (void)tweet:(NSString *)message
{
}

- (void)dealloc
{
	[twitterEngine release];
	[super dealloc];
}

@end
