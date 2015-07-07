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

    int endLine = 0;
    int count = 5;
    while (endLine < count) {
        for (int i = 0; i < count; i ++) {
            NSLog(@"1");
            endLine = i + 1;
        }
        NSLog(@"2");
    }
    
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
