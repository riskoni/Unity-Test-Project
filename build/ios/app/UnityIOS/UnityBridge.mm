//
//  UnityBridge.cpp
//  UnityIOS
//
//  Created by Nikolay Riskov on 3/20/18.
//

#include "UnityBridge.h"

void framework_message(const char* message) {
    [Communicator displayFrameworkString:[NSString stringWithUTF8String:message]];
}
