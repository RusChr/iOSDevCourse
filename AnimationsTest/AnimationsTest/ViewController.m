//
//  ViewController.m
//  AnimationsTest
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *testView;
@property (weak, nonatomic) UIImageView *testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];
    
    //self.testView = view1;
    
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    imageView1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imageView1];
    
    UIImage *image1 = [UIImage imageNamed:@"1.png"];
    UIImage *image2 = [UIImage imageNamed:@"2.png"];
    UIImage *image3 = [UIImage imageNamed:@"3.png"];
    
    NSArray *arrayOfImages = [NSArray arrayWithObjects:image1, image2, image1, image3, nil];
    
    imageView1.animationImages = arrayOfImages;
    imageView1.animationDuration = 0.5;
    [imageView1 startAnimating];
    
    self.testImageView = imageView1;
    
}

- (UIColor *)randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void)moveView:(UIView *)view {
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));

    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    CGFloat s = (float)(arc4random() % 151) / 100 + 0.5f;
    CGFloat r = (float)(arc4random() % (int)(M_PI * 20001)) / 10000 - M_PI;
    CGFloat d = (float)(arc4random() % 20001) / 10000 + 2;
    
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveLinear //| UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         view.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(r), CGAffineTransformMakeScale(s, s));
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                         NSLog(@"view frame = %@\nview bounds = %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         NSLog(@"r = %f, d = %f", r, d);
                         
                         __weak UIView *v = view;
                         [self moveView:v];
                     }];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    /*
    [UIView animateWithDuration:5
                     animations:^{
                         self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.testView.frame)/2, 75);
                     }];
    */
    
    //[self moveView:self.testView];
    [self moveView:self.testImageView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
