//
//  RCStudent.h
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCPatient.h"
#import "RCSwimmers.h"

@interface RCStudent : NSObject <RCPatient, RCSwimmers>

@property (strong, nonatomic) NSString *universityName;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat swimSpeed;

- (void)study;

@end
