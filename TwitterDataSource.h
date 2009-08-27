#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MGTwitterConnection.h"
#import "TwitterStatusCell.h"

@interface TwitterDataSource : NSObject<UITableViewDataSource> {
	IBOutlet MGTwitterConnection							*twitterConnection;
	IBOutlet UITableView										*tableView;
	NSArray																  *tweets;
}

@property(nonatomic, retain) MGTwitterConnection	*twitterConnection;
@property(nonatomic, retain) UITableView				*tableView;
- (TwitterStatusCell *)getTableCellForTableView: (UITableView *) theTableView;
- (void)refresh;
- (void)statusesReceived:(NSArray *)array forRequest:(NSString *)request;

- (TwitterStatusCell *)getNewCellFromNib;

@end
