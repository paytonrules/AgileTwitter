#import "AgileTwitterAppDelegate.h"
#import "ListTweetsViewController.h"

@implementation AgileTwitterAppDelegate

@synthesize window, navigationController, composeTweetController;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
  [window addSubview:navigationController.view];
  [window makeKeyAndVisible];
}

- (IBAction)compose
{
	[navigationController pushViewController:composeTweetController animated: YES];
}

- (IBAction)doneComposing
{
	[navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
	[navigationController release];
  [window release];
  [super dealloc];
}

@end
