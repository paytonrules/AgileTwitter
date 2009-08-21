#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TwitterEngineFactory.h"

@interface TwitterDataSource : NSObject<UITableViewDataSource> {
	IBOutlet NSObject<TwitterEngineFactory> *twitterEngineFactory;

}

@property(nonatomic, retain) NSObject<TwitterEngineFactory> *twitterEngineFactory;
- (NSString *)getFollowedTimelineFor:(NSString *)username since:(NSDate *)date startingAtPage:(int)pageNum;

@end
