//
//  RCDoctor.m
//  DelegatesTest
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCDoctor.h"

@implementation RCDoctor


#pragma mark - RCPatientDelegate

- (void)patientFeelsBad:(RCPatient *)patient {
    NSLog(@"Patient %@ feels bad.", patient.name);
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature > 39.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest.", patient.name);
    }
}


- (void)patient:(RCPatient *)patient hasQuestion:(NSString *)question {
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
