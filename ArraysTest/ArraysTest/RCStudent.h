//
//  RCStudent.h
//  ArraysTest
//
//  Created by Admin on 01.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCHuman.h"

@interface RCStudent : RCHuman

@property (strong, nonatomic) NSString *studentProperty1;
@property (strong, nonatomic) NSString *studentProperty2;

- (void)parentMovement;

@end
