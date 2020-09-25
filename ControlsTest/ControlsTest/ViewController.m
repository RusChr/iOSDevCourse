//
//  ViewController.m
//  ControlsTest
//
//  Created by Admin on 24.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


typedef enum {
    ColorSchemeTypeRGB, //Default = 0
    ColorSchemeTypeHSV //Default = 1 ...etc
} ColorSchemeType;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redComponentSlider.minimumTrackTintColor = [UIColor redColor];
    self.greenComponentSlider.minimumTrackTintColor = [UIColor greenColor];
    self.blueComponentSlider.minimumTrackTintColor = [UIColor blueColor];
    
    [self redComponentSlider];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Private Methods

- (void)refreshScreen {
    CGFloat red = self.redComponentSlider.value;
    CGFloat green = self.greenComponentSlider.value;
    CGFloat blue = self.blueComponentSlider.value;
    
    self.infoLabel.text = [NSString stringWithFormat:@"{%.2f, %.2f, %.2f}", red, green, blue];
    
    UIColor *color = nil;
    if (self.colorSchemeControl.selectedSegmentIndex == ColorSchemeTypeRGB) {
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.f];
    } else {
        color = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1.f];
    }
    
    self.view.backgroundColor = color;
}


#pragma mark - Actions

- (IBAction)actionSlider:(UISlider *)sender {
    [self refreshScreen];
}

- (IBAction)actionEnable:(UISwitch *)sender {
    self.redComponentSlider.enabled = sender.isOn;
    self.greenComponentSlider.enabled = sender.isOn;
    self.blueComponentSlider.enabled = sender.isOn;
    
    self.enableLabel.text = sender.isOn ? @"Enabled" : @"Disabled";
    /*
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    });
    */
}
@end





















