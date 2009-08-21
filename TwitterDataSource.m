#import "TwitterDataSource.h"
#import "MGTwitterEngine.h"

@implementation TwitterDataSource

@synthesize twitterEngineFactory;

-(UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *twitterCellIdentifier = @"TwitterCellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:twitterCellIdentifier];
	
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:twitterCellIdentifier] autorelease];
	}
	
	return cell;
}

- (NSString *)getFollowedTimelineSince: (NSDate *) date startingAtPage:(int) pageNum
{
	MGTwitterEngine *engine = [twitterEngineFactory createWithDelegate:self];
	
	return [engine getFollowedTimelineFor:[engine username] since:date startingAtPage:pageNum];	
}

-(void) dealloc
{
	[twitterEngineFactory release];
	[super dealloc];
}

@end
