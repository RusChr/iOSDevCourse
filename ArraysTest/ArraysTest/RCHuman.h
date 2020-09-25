//
//  RCHuman.h
//  ArraysTest
//
//  Created by Admin on 01.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RCHuman : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;
@property (strong, nonatomic) NSString *gender;

- (void)movement;

@end
