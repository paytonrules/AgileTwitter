#import <Foundation/Foundation.h>
#import "MGTwitterEngine.h"

@interface TwitterConnection : NSObject
{
	MGTwitterEngine* twitterEngine;
}

@property(nonatomic, retain) MGTwitterEngine *twitterEngine;
-(void) tweet:(NSString*) message;

@end
