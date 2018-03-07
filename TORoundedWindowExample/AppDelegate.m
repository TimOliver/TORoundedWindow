//
//  AppDelegate.m
//  TORoundedWindowExample
//
//  Created by Tim Oliver on 7/3/18.
//  Copyright © 2018 Tim Oliver. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TORoundedWindow.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    [TORoundedWindow show];
    
    return YES;
}

@end
