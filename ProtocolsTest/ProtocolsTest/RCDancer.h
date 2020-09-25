//
//  RCDancer.h
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCPatient.h"
#import "RCRunners.h"

@interface RCDancer : NSObject <RCPatient, RCRunners>

@property (strong, nonatomic) NSString *favouriteDance;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat runSpeed;

- (void)dance;

@end
