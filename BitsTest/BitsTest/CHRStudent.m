//
//  CHRStudent.m
//  BitsTest
//
//  Created by Admin on 29.09.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "CHRStudent.h"

@implementation CHRStudent

- (NSString *)answerByType:(CHRStudentSubjectType)type {
    NSLog(@"%u", self.subjectType);
    return self.subjectType & type ? @"Yes" : @"No";
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Student studies:\n"
                                        "biology = %@\n"
                                        "math = %@\n"
                                        "development = %@\n"
                                        "engineering = %@\n"
                                        "art = %@\n"
                                        "psycology = %@\n"
                                        "anatomy = %@",
                                        [self answerByType:CHRStudentSubjectTypeBiology],
                                        [self answerByType:CHRStudentSubjectTypeMath],
                                        [self answerByType:CHRStudentSubjectTypeDevelopment],
                                        [self answerByType:CHRStudentSubjectTypeEngineering],
                                        [self answerByType:CHRStudentSubjectTypeArt],
                                        [self answerByType:CHRStudentSubjectTypePsycology],
                                        [self answerByType:CHRStudentSubjectTypeAnatomy]];
}

@end
