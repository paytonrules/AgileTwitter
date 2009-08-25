#import <UIKit/UIKit.h>
#import "TwitterDataSource.h"

#define kRowHeight 100
@interface ListTweetsViewController : UITableViewController<UITableViewDelegate> {
	IBOutlet TwitterDataSource *twitterDataSource;
}

- (IBAction)refresh;
@property(nonatomic, retain) TwitterDataSource *twitterDataSource;

@end

