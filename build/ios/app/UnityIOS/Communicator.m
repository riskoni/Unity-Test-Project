//
//  Communicator.m
//  UnityIOS
//
//  Created by Nikolay Riskov on 3/20/18.
//

#import "Communicator.h"

@implementation Communicator

id _mDelegate = nil;

+ (void)displayFrameworkString:(NSString *)string{
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(displayString:)]) {
        [_mDelegate displayString: string];
    }
}

+(void)setDelegate:(id<CommunicatorDelegate>)delegate {
    _mDelegate = delegate;
}
@end
