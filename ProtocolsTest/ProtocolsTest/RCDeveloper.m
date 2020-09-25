//
//  RCDeveloper.m
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCDeveloper.h"

@implementation RCDeveloper

- (void)work {
    
}

#pragma mark - RCPatient

- (BOOL)areYouOK {
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is developer %@ ok? - %s!", self.name, ok ? "YES":"NO");
    
    return ok;
}

- (void)takePill {
    NSLog(@"Developer %@ takes a pill.", self.name);
}

- (void)makeShot {
    NSLog(@"Developer %@ makes a shot.", self.name);
}

- (NSString *)howIsYourJob {
    return @"My job is awesome!";
}

#pragma mark - RCJumpers

- (void)jump {
    NSLog(@"Developer %@ jumped %.2f meters.", self.name, self.jumpHeight);
}

- (void)run {
    NSLog(@"Developer %@ runs.", self.name);
}

@end
