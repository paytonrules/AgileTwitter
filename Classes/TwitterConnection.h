#import <Foundation/Foundation.h>
#import "TwitterConnectionProtocol.h"
#import "MGTwitterEngineDelegate.h"

@interface TwitterConnection : NSObject<MGTwitterEngineDelegate, TwitterConnectionProtocol>
{
	IBOutlet NSObject *delegate;
}

@end
