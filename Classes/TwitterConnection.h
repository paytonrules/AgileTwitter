#import <Foundation/Foundation.h>
#import "MGTwitterEngine.h"
#import "MGTwitterEngineDelegate.h"
#import "TwitterEngineFactory.h"

@interface TwitterConnection : NSObject<MGTwitterEngineDelegate>
{
	NSObject<TwitterEngineFactory>	*twitterEngineFactory;
}

@property(nonatomic, retain) NSObject<TwitterEngineFactory> *twitterEngineFactory;
-(void) tweet:(NSString*) message;
-(void) refresh;

@end
