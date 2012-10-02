//
//  ViewController.m
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import "ViewController.h"
#import "LEDControl.h"

NSString * const LEDModeKey = @"LEDMode";


@interface ViewController ()

@property (strong, nonatomic) LEDControl* ledControl;

@end


@implementation ViewController

- (void)viewDidLoad {
    self.ledControl = [[LEDControl alloc] init];
    [super viewDidLoad];
}

- (void)setLEDMode:(LEDMode)mode {
    // Select the appropriate button
    [self.onButton setSelected:(mode == LEDMode_On)];
    [self.offButton setSelected:(mode == LEDMode_Off)];
    [self.flashButton setSelected:(mode == LEDMode_Flash)];
    
    // Turn the LED on/off
    [self.ledControl setMode:mode];
}

- (void)applicationDidBecomeActive {
    // Restore whatever state we had last time we were active.
    // (On first run, the state will default to 0, which is LEDMode_Off.)
    auto savedState = [NSUserDefaults standardUserDefaults];
    LEDMode savedMode = (LEDMode)[savedState integerForKey:LEDModeKey];
    [self setLEDMode:savedMode];
}

- (void)applicationWillResignActive {
    // Save state to be restored when we are active again
    auto savedState = [NSUserDefaults standardUserDefaults];
    [savedState setInteger:[self.ledControl mode] forKey:LEDModeKey];
    
    // Turn the LED off (iOS will turn it off automatically, and we want app state to match.)
    [self.ledControl setMode:LEDMode_Off];
}

- (IBAction)onButtonWasTapped:(id)sender {
    [self setLEDMode:LEDMode_On];
}

- (IBAction)offButtonWasTapped:(id)sender {
    [self setLEDMode:LEDMode_Off];
}

- (IBAction)flashButtonWasTapped:(id)sender {
    [self setLEDMode:LEDMode_Flash];
}

@end
