//
//  RCDoctor.m
//  NotificationsTest
//
//  Created by Admin on 20.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCDoctor.h"
#import "RCGovernment.h"

@implementation RCDoctor


#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:RCGovernmentSalaryDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:RCGovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Notifications

- (void)salaryChangedNotification:(NSNotification *)notification {
    NSNumber *value = [notification.userInfo objectForKey:RCGovernmentSalaryUserInfoKey];
    CGFloat salary = [value floatValue];
    
    if (salary < self.salary) {
        NSLog(@"Doctor %@ are not happy!", self.name);
    } else {
        NSLog(@"Doctor %@ are happy!", self.name);
    }
    
    self.salary = salary;
}


- (void)averagePriceChangedNotification:(NSNotification *)notification {
    
}

@end
