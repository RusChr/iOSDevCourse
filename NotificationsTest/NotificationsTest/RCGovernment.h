//
//  RCGovernment.h
//  NotificationsTest
//
//  Created by Admin on 19.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"


extern NSString *const RCGovernmentTaxLevelDidChangeNotification; //extern - объявление глобальной константы(const). Без const будет глобальная переменная.
extern NSString *const RCGovernmentSalaryDidChangeNotification;
extern NSString *const RCGovernmentPensionDidChangeNotification;
extern NSString *const RCGovernmentAveragePriceDidChangeNotification;

extern NSString *const RCGovernmentTaxLevelUserInfoKey;
extern NSString *const RCGovernmentSalaryUserInfoKey;
extern NSString *const RCGovernmentPensionUserInfoKey;
extern NSString *const RCGovernmentAveragePriceUserInfoKey;


@interface RCGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end
