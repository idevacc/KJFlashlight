//
//  ViewController.h
//  KJFlashlight
//
//  Created by Kristopher Johnson on 10/2/12.
//  Copyright (c) 2012 Kristopher Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *onButton;
@property (weak, nonatomic) IBOutlet UIButton *offButton;
@property (weak, nonatomic) IBOutlet UIButton *flashButton;

- (IBAction)onButtonWasTapped:(id)sender;
- (IBAction)offButtonWasTapped:(id)sender;
- (IBAction)flashButtonWasTapped:(id)sender;

- (void)applicationDidBecomeActive;
- (void)applicationWillResignActive;

@end
