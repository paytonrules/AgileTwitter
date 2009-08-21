#import "ConcreteTwitterEngineFactory.h"
#import "MGTwitterEngine.h"

@implementation ConcreteTwitterEngineFactory

-(MGTwitterEngine *)createWithDelegate:(NSObject<MGTwitterEngineDelegate> *) delegate
{
	MGTwitterEngine *twitterEngine = [MGTwitterEngine twitterEngineWithDelegate: delegate];
	
	[twitterEngine setUsername:@"tddoniphone" password:@"daledaledale"];
	return twitterEngine;
}

@end
