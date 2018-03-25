//
//  UnityBridge.h
//  Unity-iPhone
//
//  Created by Nikolay Riskov on 3/20/18.
//
#ifndef UnityBridge_h
#define UnityBridge_h

#import "Communicator.h"

#ifdef __cplusplus
extern "C"{
#endif
    
    void framework_message(const char* message);
    
#ifdef __cplusplus
}
#endif


#endif /* UnityBridge_h */
