//
//  AgileTwitterAppDelegate.m
//  AgileTwitter
//
//  Created by Eric Smith on 8/16/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import "AgileTwitterAppDelegate.h"
#import "AgileTwitterViewController.h"

@implementation AgileTwitterAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
