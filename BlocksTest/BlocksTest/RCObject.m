//
//  RCObject.m
//  BlocksTest
//
//  Created by Admin on 26.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCObject.h"

@interface RCObject ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end


@implementation RCObject

- (void)dealloc {
    //NSLog(@"RCObject is deallocated!");
}


- (void)myTestMethod:(ObjectBlock)block {
    block();
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak RCObject *weakSelf = self;
        self.objectBlock = ^{
            NSLog(@"%@", weakSelf.name);
        };
    }
    return self;
}

@end
