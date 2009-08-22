#import <UIKit/UIKit.h>
#import "TwitterDataSource.h"

#define kRowHeight 100
@interface ListTweetsViewController : UITableViewController<UITableViewDelegate> {
	IBOutlet TwitterDataSource *twitterDataSource;
}

@property(nonatomic, retain) TwitterDataSource *twitterDataSource;

@end

