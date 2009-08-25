#import "TwitterDataSource.h"
#import "TwitterStatusCell.h"

@implementation TwitterDataSource

@synthesize twitterConnection, tableView;

- (TwitterStatusCell *)loadTweetAt: (NSUInteger) row intoCell: (TwitterStatusCell*) cell
{
	NSDictionary *tweet = [tweets objectAtIndex:row];
	if (tweet != nil)
	{
		cell.tweet.text = [tweet objectForKey:@"text"];
		cell.username.text = [[tweet objectForKey:@"user"] objectForKey:@"screen_name"];
	}
	
	return cell;	
}

- (UITableViewCell *)tableView: (UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	TwitterStatusCell *cell;
  cell = [self getTableCellForTableView: theTableView];
	
	[self loadTweetAt: [indexPath row] intoCell: cell];
	return cell;
}

- (TwitterStatusCell *)getTableCellForTableView: (UITableView *) theTableView  
{
  static NSString *twitterCellIdentifier = @"TwitterCellIdentifier";
	
	TwitterStatusCell *cell = (TwitterStatusCell *)[theTableView dequeueReusableCellWithIdentifier:twitterCellIdentifier];
	
	if (cell == nil)
	{
		cell = [self getNewCellFromNib];
	}
  return cell;
}
	
- (TwitterStatusCell *)getNewCellFromNib
{
	NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TwitterStatusCell" 
																							 owner:self
																						 options:nil];
	
	for (id oneObject in nib)
	{
		if ([oneObject isKindOfClass:[TwitterStatusCell class]]) 
		{
			return (TwitterStatusCell *)oneObject;
		}
	}
	
	return nil;  // your nib file is wrong
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

- (void)refresh
{
	[twitterConnection refresh];
}

- (void)dealloc
{
	[twitterConnection release];
	[tableView release];
	[tweets release];
	[super dealloc];
}

@end
