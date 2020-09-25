//
//  RCParentClass.h
//  FunctionTest
//
//  Created by Admin on 21.03.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCParentClass : NSObject

+ (void)whoAreYou;

- (void)sayHello;
- (void)say:(NSString *)string;
- (void)say:(NSString *)string and:(NSString *)string2;
- (void)say:(NSString *)string and:(NSString *)string2 andAfterThat:(NSString *)string3;

- (NSString *)saySomething;
- (NSString *)saySomeNumberString;

@end
