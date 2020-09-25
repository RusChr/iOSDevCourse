//
//  RCStudent.m
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCStudent.h"

@implementation RCStudent

- (void)study {
    
}

#pragma mark - RCPatient

- (BOOL)areYouOK {
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is student %@ ok? - %s!", self.name, ok ? "YES":"NO");
    
    return ok;
}

- (void)takePill {
    NSLog(@"Student %@ takes a pill.", self.name);
}

- (void)makeShot {
    NSLog(@"Student %@ makes a shot.", self.name);
}

- (NSString *)howIsYourFamily {
    return @"My family is doing well!";
}

#pragma mark - RCSwimmers

- (void)swim {
    NSLog(@"Student %@ floats %.2f m/s.", self.name, self.swimSpeed);
}

@end
