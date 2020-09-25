//
//  RCDancer.m
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCDancer.h"

@implementation RCDancer

- (void)dance {
    
}

#pragma mark - RCPatient

- (BOOL)areYouOK {
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is dancer %@ ok? - %s!", self.name, ok ? "YES":"NO");
    
    return ok;
}

- (void)takePill {
    NSLog(@"Dancer %@ takes a pill.", self.name);
}

- (void)makeShot {
    NSLog(@"Dancer %@ makes a shot.", self.name);
}

#pragma mark - RCRunners

- (void)run {
    NSLog(@"Dancer %@ runs %.1f km/h.", self.name, self.runSpeed);
}

- (void)jump {
    NSLog(@"Dancer %@ jumped.", self.name);
}

@end
