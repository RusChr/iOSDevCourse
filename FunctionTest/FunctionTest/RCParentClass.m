//
//  RCParentClass.m
//  FunctionTest
//
//  Created by Admin on 21.03.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCParentClass.h"

@implementation RCParentClass

- (id)init{
    self = [super init];
    if (self) {
        NSLog(@"Instance of parent class is initialized!");
    }
    return self;
}

+ (void)whoAreYou {
    NSLog(@"A IM %@", self);
}


- (void)sayHello {
    NSLog(@"Parent says hello! %@", self);
}

- (void)say:(NSString *)string {
    NSLog(@"%@", string);
}

- (void)say:(NSString *)string and:(NSString *)string2 {
    NSLog(@"%@, %@", string, string2);
}

- (void)say:(NSString *)string and:(NSString *)string2 andAfterThat:(NSString *)string3 {
    NSLog(@"%@, %@, %@", string, string2, string3);
}


- (NSString *)saySomeNumberString {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (NSString *)saySomething {
    NSString *string = [self saySomeNumberString];    
    return string;
}





@end
