#import "ComposeTweetViewControllerTest.h"
#import "ComposeTweetViewController.h"

@implementation ComposeTweetViewControllerTest

- (void)testComposeTweetViewControllerTest 
{
	[[[ComposeTweetViewController alloc] init] autorelease];
	
	STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
}

@end
