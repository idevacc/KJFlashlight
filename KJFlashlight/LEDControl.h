//
//  LED.h
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

// Values for LEDControl "mode" property
enum LEDMode {
    LEDMode_Off,
    LEDMode_On,
    LEDMode_Flash
};


@interface LEDControl : NSObject

@property (nonatomic) LEDMode mode;

@end
