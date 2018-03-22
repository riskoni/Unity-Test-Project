//
//  AppDelegate.m
//
//  Created by Nikolay Riskov on 3/20/18.
//  Copyright © 2018 Riskov. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (UIWindow *)getUnityWindow{
    return UnityGetMainWindow();
}

- (void) unityCallFunction: (NSString *) func msg: (NSString *) message{
    
    UnitySendMessage("Main Camera",
                     [func cStringUsingEncoding:NSUTF8StringEncoding],
                     [message cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.unityController = [[UnityAppController alloc] init];
    [self.unityController application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    [self.unityController applicationWillResignActive:application];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.unityController applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.unityController applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.unityController applicationDidBecomeActive:application];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self.unityController applicationWillTerminate:application];
}


@end

