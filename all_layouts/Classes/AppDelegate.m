//
//  AppDelegate.m
//
//
//  Created by xiekw on 15/3/24.
//  Copyright (c) 2015年 Modudu. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import <FLEX/FLEXManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    HomeViewController* catalogController = [[HomeViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:catalogController];
    [self.window makeKeyAndVisible];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
//    [[FLEXManager sharedManager] showExplorer];
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
