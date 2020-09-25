//
//  RCStudent.h
//  TableEditingTest
//
//  Created by Admin on 22.11.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RCStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) CGFloat averageGrade;

+ (RCStudent *)randomStudent;

@end
