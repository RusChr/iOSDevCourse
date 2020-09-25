//
//  RCGovernment.m
//  NotificationsTest
//
//  Created by Admin on 19.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCGovernment.h"


NSString *const RCGovernmentTaxLevelDidChangeNotification = @"RCGovernmentTaxLevelDidChangeNotification";
NSString *const RCGovernmentSalaryDidChangeNotification = @"RCGovernmentSalaryDidChangeNotification";
NSString *const RCGovernmentPensionDidChangeNotification = @"RCGovernmentPensionDidChangeNotification";
NSString *const RCGovernmentAveragePriceDidChangeNotification = @"RCGovernmentAveragePriceDidChangeNotification";

NSString *const RCGovernmentTaxLevelUserInfoKey = @"RCGovernmentTaxLevelUserInfoKey";
NSString *const RCGovernmentSalaryUserInfoKey = @"RCGovernmentSalaryUserInfoKey";
NSString *const RCGovernmentPensionUserInfoKey = @"RCGovernmentPensionUserInfoKey";
NSString *const RCGovernmentAveragePriceUserInfoKey = @"RCGovernmentAveragePriceUserInfoKey";


@implementation RCGovernment

- (instancetype)init {
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000.f;
        _pension = 500.f;
        _averagePrice = 10.f;
    }
    return self;
}

- (void)setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:RCGovernmentTaxLevelUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:RCGovernmentTaxLevelDidChangeNotification object:nil userInfo:dictionary];
}


- (void)setSalary:(CGFloat)salary {
    _salary = salary;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:RCGovernmentSalaryUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:RCGovernmentSalaryDidChangeNotification object:nil userInfo:dictionary];
}


- (void)setPension:(CGFloat)pension {
    _pension = pension;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:RCGovernmentPensionUserInfoKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:RCGovernmentPensionDidChangeNotification object:nil userInfo:dictionary];
}


- (void)setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:RCGovernmentAveragePriceUserInfoKey];    
    [[NSNotificationCenter defaultCenter] postNotificationName:RCGovernmentAveragePriceDidChangeNotification object:nil userInfo:dictionary];
}




@end
