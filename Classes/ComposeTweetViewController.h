#import <UIKit/UIKit.h>
#import "MGTwitterConnection.h"
#import "AgileTwitterAppDelegate.h"

@interface ComposeTweetViewController : UIViewController
{
	IBOutlet UITextView								*textView;
	IBOutlet MGTwitterConnection				*twitterConnection;
	IBOutlet AgileTwitterAppDelegate	*appDelegate;
}

-(IBAction) tweet;
@property(nonatomic, retain) UITextView *textView;
@property(nonatomic, retain) MGTwitterConnection *twitterConnection;
@property(nonatomic, retain) AgileTwitterAppDelegate *appDelegate;

@end
