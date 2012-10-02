//
//  LED.m
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import "LEDControl.h"

@interface LEDControl ()

@property (nonatomic) NSTimer *timer;
@property (nonatomic) BOOL isTorchOn;

@end


@implementation LEDControl

- (void)setMode:(LEDMode)mode {
    if (mode != _mode) {
        
        [self stopFlash];
        
        _mode = mode;
        
        switch (mode) {
            case ledOn:
                [self turnTorchOn];
                break;
            case ledFlash:
                [self startFlash];
                break;
            case ledOff:
            default:
                [self turnTorchOff];
                break;
        }
    }
}

- (void)turnTorchOn {
    auto device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    device.torchMode = AVCaptureTorchModeOn;
    [device unlockForConfiguration];
    
    self.isTorchOn = YES;
}

- (void)turnTorchOff {
    auto device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    device.torchMode = AVCaptureTorchModeOff;
    [device unlockForConfiguration];
    
    self.isTorchOn = NO;
}

- (void)startFlash {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                  target:self
                                                selector:@selector(flashTimerDidFire:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stopFlash {
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)flashTimerDidFire:(NSTimer *)timer {
    if (self.isTorchOn)
        [self turnTorchOff];
    else
        [self turnTorchOn];
}

@end
