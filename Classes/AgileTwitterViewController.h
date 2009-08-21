#import <UIKit/UIKit.h>
#import "TwitterDataSource.h"

@interface AgileTwitterViewController : UIViewController {
	TwitterDataSource *twitterDataSource;
}

@property(nonatomic, retain) TwitterDataSource *twitterDataSource;

@end

