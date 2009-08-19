//
//  AgileTwitterAppDelegate.h
//  AgileTwitter
//
//  Created by Eric Smith on 8/16/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AgileTwitterViewController;

@interface AgileTwitterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AgileTwitterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AgileTwitterViewController *viewController;

@end

