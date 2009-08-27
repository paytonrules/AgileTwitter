#import <Foundation/Foundation.h>
#import "MGTwitterEngine.h"
#import "MGTwitterEngineDelegate.h"
#import "MGTwitterEngine.h"
#import "TwitterConnection.h"

@interface MGTwitterConnection : TwitterConnection
{
	MGTwitterEngine *twitterEngine;
}

@property(nonatomic, retain) MGTwitterEngine *twitterEngine;
@end
