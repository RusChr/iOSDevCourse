//
//  DrawingView.m
//  DrawingsTest
//
//  Created by Admin on 21.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //[super drawRect:rect];
    
    NSLog(@"drawRect %@", NSStringFromCGRect(rect));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect square1 = CGRectMake(50, 50, 50, 50);
    CGRect square2 = CGRectMake(100, 100, 50, 50);
    CGRect square3 = CGRectMake(150, 150, 50, 50);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    //CGContextFillRect(context, rect);
    CGContextAddRect(context, square1);
    CGContextAddRect(context, square2);
    CGContextAddRect(context, square3);
    CGContextFillPath(context);
    
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextAddEllipseInRect(context, square1);
    CGContextAddEllipseInRect(context, square2);
    CGContextAddEllipseInRect(context, square3);
    CGContextFillPath(context);
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddRect(context, CGRectMake(50, 250, 50, 50));
    CGContextAddRect(context, CGRectMake(100, 300, 50, 50));
    CGContextAddRect(context, CGRectMake(150, 350, 50, 50));
    CGContextStrokePath(context);
    
    
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddLineToPoint(context, CGRectGetMinX(square3), CGRectGetMaxY(square3));
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square1), CGRectGetMinY(square1));
    CGContextAddLineToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddArc(context, CGRectGetMaxX(square1), CGRectGetMaxY(square1), CGRectGetWidth(square1), M_PI, M_PI/2, YES);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextStrokePath(context);
    
}


@end
