//
//  NSString+Random.m
//  SearchTest
//
//  Created by Admin on 12.01.17.
//  Copyright © 2017 RusChr. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)randomAlphanumericString
{
    int length = arc4random() % 11 + 5;
    return [self randomAlphanumericStringWithLength:length]; // This self is method of class, no object
}

+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz"; //ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    return randomString;
}

@end
