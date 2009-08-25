#import "ComposeTweetViewController.h"

@implementation ComposeTweetViewController

@synthesize textView, twitterConnection, appDelegate;

-(IBAction) tweet
{
	[twitterConnection tweet:textView.text];
	textView.text = @"";
	[appDelegate doneComposing];
}

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
	[textView becomeFirstResponder];
}

- (void)dealloc
{
	[twitterConnection release];
	[textView release];
	[appDelegate release];
	[super dealloc];
}	
@end
