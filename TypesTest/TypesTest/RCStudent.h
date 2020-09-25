//
//  RCStudent.h
//  TypesTest
//
//  Created by Admin on 04.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCStudent : NSObject

typedef enum {
    RCGenderMale,
    RCGenderFemale
} RCGender;

//typedef NSInteger RCTaburetka;

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) RCGender gender;

@end
