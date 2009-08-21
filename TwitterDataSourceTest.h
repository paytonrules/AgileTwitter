#import "GTMSenTestCase.h"
#import <UIKit/UIKit.h>
#import <OCMock/OCMock.h>

@interface TwitterDataSourceTest : GTMTestCase {
	TwitterDataSource *twitterDataSource;
	OCMockObject			*twitterEngine;
	OCMockObject			*twitterEngineFactory;
}

@end
