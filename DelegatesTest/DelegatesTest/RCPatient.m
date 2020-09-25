//
//  RCPatient.m
//  DelegatesTest
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCPatient.h"

@implementation RCPatient

- (BOOL)howAreYou {
    BOOL iFeelGood = arc4random() % 2;
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self];
        //[self.delegate patient:self hasQuestion:@"tru-lya-lya?"];
    }
    return iFeelGood;
}

- (void)takePill {
    NSLog(@"%@ takes a pill.", self.name);
}

- (void)makeShot {
    NSLog(@"%@ makes a shot.", self.name);
}

- (BOOL)wasWorse {
    if (self.headache) {
        [self.delegate patientFeelsBad:self];
    }
    return self.headache;
}

@end
