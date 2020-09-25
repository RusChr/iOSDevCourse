//
//  ViewController.m
//  OutletsTest
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)randomFromZeroToOne {
    return (float)(arc4random() % 255) / 255;
}

- (UIColor *)randomColor {
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    //self.testView.backgroundColor = [self randomColor];
    //self.testView2.backgroundColor = [self randomColor];
    
    for (UIView *v in self.testViews) {
        v.backgroundColor = [self randomColor];
    }
}


@end
