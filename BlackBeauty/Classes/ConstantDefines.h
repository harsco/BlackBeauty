//
//  ConstantDefines.h
//  BlackBeauty
//
//  Created by Mahi on 4/30/13.
//  Copyright (c) 2013 Mahi. All rights reserved.
//


//Yes, it is PMS 165.C: 0M: 59Y: 96K: 0R:245G: 132B: 38Web/hex color: #f58426

#import <Foundation/Foundation.h>

#define LOCATIONSDB @"location.db"
#define DEG2RAD(degrees) (degrees * 0.01745327) // degrees * pi over 180
#define RELEASE_TO_NIL(x) { if (x!=nil) { [x release]; x = nil; } }

typedef enum  {
    
    MyLocation,
    OtherLocation
}USERPREFERENCE;

@interface ConstantDefines : NSObject

@end
