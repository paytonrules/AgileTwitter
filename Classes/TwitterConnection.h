#import <Foundation/Foundation.h>
#import "MGTwitterEngine.h"
#import "MGTwitterEngineDelegate.h"

@interface TwitterConnection : NSObject<MGTwitterEngineDelegate>
{
	id															delegate;
	MGTwitterEngine									*twitterEngine;
}

@property(nonatomic, retain) id delegate;
@property(nonatomic, retain) MGTwitterEngine *twitterEngine;
-(void) tweet:(NSString*) message;
-(void) refresh;

@end
