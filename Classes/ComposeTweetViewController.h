#import <UIKit/UIKit.h>
#import "TwitterConnection.h"

@interface ComposeTweetViewController : UIViewController
{
	IBOutlet UITextView					*textView;
	IBOutlet TwitterConnection	*twitterConnection;
}

-(IBAction) tweet;
@property(nonatomic, retain) UITextView *textView;
@property(nonatomic, retain) TwitterConnection *twitterConnection;

@end
