#import <UIKit/UIKit.h>
#import "TwitterConnectionProtocol.h"
#import "AgileTwitterAppDelegate.h"

@interface ComposeTweetViewController : UIViewController
{
	IBOutlet UITextView														*textView;
	IBOutlet NSObject<TwitterConnectionProtocol>	*twitterConnection;
	IBOutlet AgileTwitterAppDelegate							*appDelegate;
}

-(IBAction) tweet;
@property(nonatomic, retain) UITextView *textView;
@property(nonatomic, retain) NSObject<TwitterConnectionProtocol> *twitterConnection;
@property(nonatomic, retain) AgileTwitterAppDelegate *appDelegate;

@end
