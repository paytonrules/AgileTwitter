//
//  AgileTwitterAppDelegate.h
//  AgileTwitter
//
//  Created by Eric Smith on 8/16/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListTweetsViewController;

@interface AgileTwitterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ListTweetsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ListTweetsViewController *viewController;

@end

