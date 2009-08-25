#import <UIKit/UIKit.h>
#import "TwitterConnection.h"
#import "AgileTwitterAppDelegate.h"

@interface ComposeTweetViewController : UIViewController
{
	IBOutlet UITextView								*textView;
	IBOutlet TwitterConnection				*twitterConnection;
	IBOutlet AgileTwitterAppDelegate	*appDelegate;
}

-(IBAction) tweet;
@property(nonatomic, retain) UITextView *textView;
@property(nonatomic, retain) TwitterConnection *twitterConnection;
@property(nonatomic, retain) AgileTwitterAppDelegate *appDelegate;

@end
