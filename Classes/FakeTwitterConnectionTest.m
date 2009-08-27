#import "FakeTwitterConnectionTest.h"
#import "FakeTwitterConnection.h"

@implementation FakeTwitterConnectionTest

- (void)testRefreshUpdatesTheStatuses
{
	NSObject<TwitterConnectionProtocol> *connection = [[FakeTwitterConnection alloc] init];
}

@end
