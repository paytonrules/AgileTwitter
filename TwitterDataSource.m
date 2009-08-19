#import "TwitterDataSource.h"

@implementation TwitterDataSource

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

@end
