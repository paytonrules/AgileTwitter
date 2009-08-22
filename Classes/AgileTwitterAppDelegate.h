#import <UIKit/UIKit.h>
#import "AgileTwitterAppDelegate.h"

@class ListTweetsViewController;

@interface AgileTwitterAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window;
	UINavigationController *navigationController;
	UIViewController *composeTweetController;
}

-(IBAction) compose;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UIViewController *composeTweetController;

@end

