//
//  RCObject.h
//  BlocksTest
//
//  Created by Admin on 26.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^ObjectBlock)(void);


@interface RCObject : NSObject

@property (strong, nonatomic) NSString *name;


- (void)myTestMethod:(ObjectBlock)block;

@end
