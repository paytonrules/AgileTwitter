#import "TwitterDataSource.h"
#import "MGTwitterEngine.h"
#import "TwitterStatusCell.h"

@implementation TwitterDataSource

@synthesize twitterEngineFactory, tableView;

// Table View Cell delegate methods
- (UITableViewCell *)tableView: (UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *twitterCellIdentifier = @"TwitterCellIdentifier";
	
	TwitterStatusCell *cell = (TwitterStatusCell *)[theTableView dequeueReusableCellWithIdentifier:twitterCellIdentifier];
	
	if (cell == nil)
	{
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TwitterStatusCell" 
																								 owner:self
																							 options:nil];
		
		// Not well tested - would need mock nib file loading - not sure its worth the effort in thise case. 
		
		for (id oneObject in nib)
			if ([oneObject isKindOfClass:[TwitterStatusCell class]]) 
				cell = (TwitterStatusCell *)oneObject;
		
	}

	NSDictionary *tweet = [tweets objectAtIndex:[indexPath row]];
	if (tweet != nil)
	{
		cell.tweet.text = [tweet objectForKey:@"text"];
		cell.username.text = [[tweet objectForKey:@"user"] objectForKey:@"screen_name"];
	}
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [tweets count];
}

// Delegate Methods (callbacks) from MGTwitterEngines
- (void)statusesReceived:(NSArray *)statuses forRequest:(NSString *)identifier
{
	if(tweets != nil)
	{
		[tweets release];
	}
	
	tweets = [NSArray arrayWithArray:statuses];
	[tableView reloadData];
	[tweets retain];
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

// MGTwitterEngine Call wrappers
- (NSString *)getFollowedTimelineSince: (NSDate *) date startingAtPage:(int) pageNum
{
	MGTwitterEngine *engine = [twitterEngineFactory createWithDelegate:self];
	
	return [engine getFollowedTimelineFor:[engine username] since:date startingAtPage:pageNum];	
}

- (void)dealloc
{
	[twitterEngineFactory release];
	[tableView release];
	[tweets release];
	[super dealloc];
}

@end
