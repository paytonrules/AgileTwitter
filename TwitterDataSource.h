#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TwitterEngineFactory.h"
#import "TwitterConnection.h"
#import "TwitterStatusCell.h"

@interface TwitterDataSource : NSObject<UITableViewDataSource> {
	IBOutlet TwitterConnection							*twitterConnection;
	IBOutlet UITableView										*tableView;
	NSArray																  *tweets;
}

@property(nonatomic, retain) TwitterConnection	*twitterConnection;
@property(nonatomic, retain) UITableView				*tableView;
- (TwitterStatusCell *)getTableCellForTableView: (UITableView *) theTableView;
- (void)refresh;
- (void)statusesReceived:(NSArray *)array forRequest:(NSString *)request;

- (TwitterStatusCell *)getNewCellFromNib;

@end
