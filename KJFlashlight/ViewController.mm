//
//  ViewController.m
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import "ViewController.h"

NSString * const LEDModeKey = @"LEDMode";


@implementation ViewController

- (void)viewDidLoad {
    self.led = [[LEDControl alloc] init];
    [super viewDidLoad];
}

- (void)applicationDidBecomeActive {
    auto savedState = [NSUserDefaults standardUserDefaults];
    LEDMode savedMode = (LEDMode)[savedState integerForKey:LEDModeKey];
    
    [self setMode:savedMode];
}

- (void)applicationWillResignActive {
    // Save state to be restored when we are active again
    auto savedState = [NSUserDefaults standardUserDefaults];
    [savedState setInteger:self.led.mode forKey:LEDModeKey];
    
    self.led.mode = ledOff;
}

- (void)setMode:(LEDMode)mode {
    [self.onButton setSelected:(mode == ledOn)];
    [self.offButton setSelected:(mode == ledOff)];
    [self.flashButton setSelected:(mode == ledFlash)];

    self.led.mode = mode;
}

- (IBAction)onButtonWasTapped:(id)sender {
    [self setMode:ledOn];
}

- (IBAction)offButtonWasTapped:(id)sender {
    [self setMode:ledOff];
}

- (IBAction)flashButtonWasTapped:(id)sender {
    [self setMode:ledFlash];
}

@end
