#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TwitterEngineFactory.h"
#import "MGTwitterEngineDelegate.h"

@interface TwitterDataSource : NSObject<UITableViewDataSource, MGTwitterEngineDelegate> {
	IBOutlet NSObject<TwitterEngineFactory> *twitterEngineFactory;
	IBOutlet UITableView										*tableView;
	NSArray																  *tweets;
}

@property(nonatomic, retain) NSObject<TwitterEngineFactory> *twitterEngineFactory;
@property(nonatomic, retain) UITableView										*tableView;
- (NSString *)getFollowedTimelineSince: (NSDate *) date startingAtPage:(int) pageNum;

@end
