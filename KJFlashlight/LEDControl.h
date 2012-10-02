//
//  LED.h
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

enum LEDMode {
    ledOff,
    ledOn,
    ledFlash
};

@interface LEDControl : NSObject

@property (nonatomic) LEDMode mode;

@end
