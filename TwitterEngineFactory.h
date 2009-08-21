#import "MGTwitterEngine.h"
#import "MGTwitterEngineDelegate.h"

@protocol TwitterEngineFactory

-(MGTwitterEngine *)createWithDelegate: (NSObject<MGTwitterEngineDelegate> *)delegate;

@end