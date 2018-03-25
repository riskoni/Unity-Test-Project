//
//  AppDelegate.h
//  Native
//
//  Created by Nikolay Riskov on 3/22/18.
//  Copyright © 2018 Riskov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnityAppController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow* window;
@property (strong, nonatomic) UnityAppController*  unityController;


- (void) unityCallFunction: (NSString *) func msg: (NSString *) message;

@end
