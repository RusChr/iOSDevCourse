//
//  RCChildClass.m
//  FunctionTest
//
//  Created by Admin on 22.03.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCChildClass.h"

@implementation RCChildClass

- (id)init{
    self = [super init];
    if (self) {
        NSLog(@"Instance of child class is initialized!");
    }
    return self;
}

- (NSString *)saySomeNumberString {
    return @"Something!";
}

- (NSString *)saySomething {
    return [super saySomeNumberString];
}


@end
