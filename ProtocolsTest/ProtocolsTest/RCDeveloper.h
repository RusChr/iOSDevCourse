//
//  RCDeveloper.h
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCPatient.h"
#import "RCJumpers.h"

@interface RCDeveloper : NSObject <RCPatient, RCJumpers>

@property (assign, nonatomic) CGFloat experince;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat jumpHeight;

- (void)work;

@end
