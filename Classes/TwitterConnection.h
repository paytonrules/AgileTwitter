#import <Foundation/Foundation.h>
#import "MGTwitterEngine.h"
#import "MGTwitterEngineDelegate.h"
#import "TwitterEngineFactory.h"

@interface TwitterConnection : NSObject<MGTwitterEngineDelegate>
{
	NSObject<TwitterEngineFactory>	*twitterEngineFactory;
	id															delegate;
	MGTwitterEngine									*twitterEngine;
}

@property(nonatomic, retain) NSObject<TwitterEngineFactory> *twitterEngineFactory;
@property(nonatomic, retain) id delegate;
@property(nonatomic, retain) MGTwitterEngine *twitterEngine;
-(void) tweet:(NSString*) message;
-(void) refresh;

@end
