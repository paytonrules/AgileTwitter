#import "ListTweetsViewCOntroller.h"

@implementation ListTweetsViewController

@synthesize twitterDataSource;

- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return kRowHeight;
}

- (void)viewDidLoad 
{
	[super viewDidLoad];
	[twitterDataSource refresh];
}

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.twitterDataSource = nil;
}

- (IBAction) refresh
{
	[twitterDataSource refresh];
}

- (void)dealloc 
{
	[twitterDataSource release];
  [super dealloc];
}

@end
