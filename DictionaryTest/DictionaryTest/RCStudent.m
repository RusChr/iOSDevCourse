//
//  RCStudent.m
//  DictionaryTest
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCStudent.h"

@implementation RCStudent

- (NSString *)studentID {
    NSString *concat = [self.name stringByAppendingString:self.lastName];
    return concat;
}
@end
