#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TwitterConnectionProtocol.h"
#import "TwitterStatusCell.h"

@interface TwitterDataSource : NSObject<UITableViewDataSource> {
	IBOutlet NSObject<TwitterConnectionProtocol>	*twitterConnection;
	IBOutlet UITableView													*tableView;
	NSArray																				*tweets;
}

@property(nonatomic, retain) NSObject<TwitterConnectionProtocol>	*twitterConnection;
@property(nonatomic, retain) UITableView				*tableView;
- (TwitterStatusCell *)getTableCellForTableView: (UITableView *) theTableView;
- (void)refresh;
- (void)statusesReceived:(NSArray *)array forRequest:(NSString *)request;

- (TwitterStatusCell *)getNewCellFromNib;

@end
