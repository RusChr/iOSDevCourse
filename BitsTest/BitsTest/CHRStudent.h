//
//  CHRStudent.h
//  BitsTest
//
//  Created by Admin on 29.09.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CHRStudentSubjectTypeBiology        = 1 << 0,
    CHRStudentSubjectTypeMath           = 1 << 1,
    CHRStudentSubjectTypeDevelopment    = 1 << 2,
    CHRStudentSubjectTypeEngineering    = 1 << 3,
    CHRStudentSubjectTypeArt            = 1 << 4,
    CHRStudentSubjectTypePsycology      = 1 << 5,
    CHRStudentSubjectTypeAnatomy        = 1 << 6
    
} CHRStudentSubjectType;


@interface CHRStudent : NSObject

@property (assign, nonatomic) CHRStudentSubjectType subjectType;
/*
@property (assign, nonatomic) BOOL studiesBiology;
@property (assign, nonatomic) BOOL studiesMath;
@property (assign, nonatomic) BOOL studiesDevelopment;
@property (assign, nonatomic) BOOL studiesEngineering;
@property (assign, nonatomic) BOOL studiesArt;
@property (assign, nonatomic) BOOL studiesPsycology;
@property (assign, nonatomic) BOOL studiesAnatomy;
*/
@end
