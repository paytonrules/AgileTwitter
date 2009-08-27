#import <Foundation/Foundation.h>
#import "MGTwitterEngine.h"
#import "MGTwitterEngineDelegate.h"
#import "TwitterEngineProtocol.h"

@interface TwitterConnection : NSObject<MGTwitterEngineDelegate>
{
	IBOutlet id											delegate;
	NSObject<TwitterEngineProtocol> *twitterEngine;
}

@property(nonatomic, retain) id delegate;
@property(nonatomic, retain) NSObject<TwitterEngineProtocol> *twitterEngine;
-(void) tweet:(NSString*) message;
-(void) refresh;

@end
