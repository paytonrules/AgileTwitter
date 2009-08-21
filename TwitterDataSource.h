#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TwitterEngineFactory.h"

@interface TwitterDataSource : NSObject<UITableViewDataSource> {
	IBOutlet NSObject<TwitterEngineFactory> *twitterEngineFactory;

}

@property(nonatomic, retain) NSObject<TwitterEngineFactory> *twitterEngineFactory;
- (NSString *)getFollowedTimelineSince: (NSDate *) date startingAtPage:(int) pageNum;

@end
