//
//  LED.m
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import "LEDControl.h"


const NSTimeInterval flashTimerInterval = 0.5;


@interface LEDControl ()

@property (nonatomic) BOOL isTorchOn;

@property (nonatomic) NSTimer *flashTimer;

@end


@implementation LEDControl

- (void)setMode:(LEDMode)mode {
    if (mode != _mode) {
        [self stopFlash];
        
        _mode = mode;
        
        switch (mode) {
            case LEDMode_On:
                [self setTorchOn:YES];
                break;
                
            case LEDMode_Flash:
                [self startFlash];
                break;
                
            case LEDMode_Off:
            default:
                [self setTorchOn:NO];
                break;
        }
    }
}

- (void)setTorchOn:(BOOL)on {
    auto device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    device.torchMode = on? AVCaptureTorchModeOn : AVCaptureTorchModeOff;
    [device unlockForConfiguration];
    
    self.isTorchOn = on;
}


#pragma mark - Flash timer

- (void)startFlash {
    self.flashTimer = [NSTimer scheduledTimerWithTimeInterval:flashTimerInterval
                                                       target:self
                                                     selector:@selector(flashTimerDidFire:)
                                                     userInfo:nil
                                                      repeats:YES];
}

- (void)stopFlash {
    if (self.flashTimer != nil) {
        [self.flashTimer invalidate];
        self.flashTimer = nil;
    }
}

- (void)flashTimerDidFire:(NSTimer *)timer {
    // Toggle torch state
    [self setTorchOn:(!self.isTorchOn)];
}

@end
