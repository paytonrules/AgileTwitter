#import "TwitterDataSource.h"
#import "MGTwitterEngine.h"

@implementation TwitterDataSource

@synthesize twitterEngineFactory, tableView;

- (UITableViewCell *)tableView: (UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *twitterCellIdentifier = @"TwitterCellIdentifier";
	
	UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:twitterCellIdentifier];
	
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 0;
}

- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier
{
	[tableView reloadData];
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
