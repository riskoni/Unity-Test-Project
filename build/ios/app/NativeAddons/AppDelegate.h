//
//  AppDelegate.h
//
//  Created by Nikolay Riskov on 3/20/18.
//  Copyright © 2018 Riskov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnityAppController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow* window;
@property (strong, nonatomic) UnityAppController*  unityController;

- (UIWindow *)getUnityWindow;
- (void) unityCallFunction: (NSString *) func msg: (NSString *) message;

@end


