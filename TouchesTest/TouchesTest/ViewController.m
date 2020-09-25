//
//  ViewController.m
//  TouchesTest
//
//  Created by Admin on 12.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (weak, nonatomic) UIView *testView;
@property (weak, nonatomic) UIView *draggingView;
@property (assign, nonatomic) CGPoint touchOffset;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSInteger iI = arc4random() % 5 + 1;
    NSInteger jJ = arc4random() % 9 + 1;
    
    for (int i = 0; i < iI; i++) {
        for (int j = 0; j < jJ; j++) {
            UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10 + 60*i, 20 + 60*j, 50, 50)];
            view1.backgroundColor = [self randomColor];
            view1.layer.cornerRadius = 5.f;
            
            [self.view addSubview:view1];
        }
    }
    NSLog(@"iI = %li, jJ = %li", iI, jJ);
    
    //self.testView = view1;
    //self.view.multipleTouchEnabled = YES;
}

- (void)createViewOnLocationX:(CGFloat)x andY:(CGFloat)y {
    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(x, y, 50, 50)];
    newView.backgroundColor = [self randomColor];
    
    //[self.view addSubview:newView];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         newView.alpha = 0.85f;
                         newView.layer.cornerRadius = 5.f;
                         
                         [self.view addSubview:newView];
                     }];
}


#pragma mark - Private Methods

- (void)logTouches:(NSSet *)touches withMethod:(NSString *)methodName {
    NSMutableString *string = [NSMutableString stringWithString:methodName];
    
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        
        [string appendFormat:@" %@", NSStringFromCGPoint(point)];
    }
    
    NSLog(@"%@", string);
}

- (UIColor *) randomColor {
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}


#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesBegan"];
    
    UITouch *touch = [touches anyObject];
    //CGPoint point = [touch locationInView:self.testView];
    CGPoint pointOnMainView = [touch locationInView:self.view];
    UIView *view2 = [self.view hitTest:pointOnMainView withEvent:event];
    
    if (![view2 isEqual:self.view]) {
        self.draggingView = view2;
        
        [self.view bringSubviewToFront:self.draggingView];
        
        CGPoint touchPoint = [touch locationInView:self.draggingView];
        self.touchOffset = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.draggingView.bounds) - touchPoint.y);
        
        //[self.draggingView.layer removeAllAnimations];
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                             self.draggingView.alpha = 0.3f;
                         }];
        
        self.draggingView.backgroundColor = [self randomColor];
    } else {
        self.draggingView = nil;
        
        [self createViewOnLocationX:pointOnMainView.x andY:pointOnMainView.y];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesMoved"];
    
    if (self.draggingView) {
        UITouch *touch = [touches anyObject];
        CGPoint pointOnMainView = [touch locationInView:self.view];
        CGPoint correction = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                         pointOnMainView.y + self.touchOffset.y);
        self.draggingView.center = correction;
    }
}

- (void)onTouchesEnded {
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity;
                         self.draggingView.alpha = 1.f;
                     }];
    
    self.draggingView = nil;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesEnded"];
    
    [self onTouchesEnded];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesCancelled"];
    
    [self onTouchesEnded];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
