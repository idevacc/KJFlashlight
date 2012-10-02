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
    self.ledControl = [[LEDControl alloc] init];
    [super viewDidLoad];
}

- (void)setMode:(LEDMode)mode {
    // Select the appropriate button
    [self.onButton setSelected:(mode == ledOn)];
    [self.offButton setSelected:(mode == ledOff)];
    [self.flashButton setSelected:(mode == ledFlash)];
    
    // Turn the LED on/off
    [self.ledControl setMode:mode];
}

- (void)applicationDidBecomeActive {
    // Restore whatever state we had last time we were active.
    // (On first run, the state will default to 0, which is ledOff.)
    auto savedState = [NSUserDefaults standardUserDefaults];
    LEDMode savedMode = (LEDMode)[savedState integerForKey:LEDModeKey];
    [self setMode:savedMode];
}

- (void)applicationWillResignActive {
    // Save state to be restored when we are active again
    auto savedState = [NSUserDefaults standardUserDefaults];
    [savedState setInteger:[self.ledControl mode] forKey:LEDModeKey];
    
    // Turn the LED off (iOS will turn it off automatically, and we want app state to match.)
    [self.ledControl setMode:ledOff];
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
