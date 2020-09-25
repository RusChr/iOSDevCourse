//
//  RCStudent.h
//  DictionaryTest
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCStudent : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *hello;

-(NSString *)studentID;

@end
