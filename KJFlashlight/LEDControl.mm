//
//  LED.m
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import "LEDControl.h"


const NSTimeInterval flashTimerInterval = 0.5;


@interface LEDControl () {
    BOOL _isTorchOn;
    NSTimer *_flashTimer;
}
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
    
    _isTorchOn = on;
}


#pragma mark - Flash timer

- (void)startFlash {
    _flashTimer = [NSTimer scheduledTimerWithTimeInterval:flashTimerInterval
                                                   target:self
                                                 selector:@selector(flashTimerDidFire:)
                                                 userInfo:nil
                                                  repeats:YES];
}

- (void)stopFlash {
    if (_flashTimer != nil) {
        [_flashTimer invalidate];
        _flashTimer = nil;
    }
}

- (void)flashTimerDidFire:(NSTimer *)timer {
    // Toggle torch state
    [self setTorchOn:(!_isTorchOn)];
}

@end
