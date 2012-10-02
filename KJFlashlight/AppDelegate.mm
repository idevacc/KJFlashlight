//
//  AppDelegate.m
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [self.viewController applicationWillResignActive];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self.viewController applicationDidBecomeActive];
}

@end
