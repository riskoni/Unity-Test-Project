//
//  Communicator.h
//  UnityIOS
//
//  Created by Nikolay Riskov on 3/20/18.
//

#import <Foundation/Foundation.h>

@protocol CommunicatorDelegate <NSObject>

- (void)displayString:(NSString *) string;

@end

@interface Communicator : NSObject

+ (void)displayFrameworkString:(NSString *)string;
+ (void)setDelegate:(id<CommunicatorDelegate>)delegate;

@end
