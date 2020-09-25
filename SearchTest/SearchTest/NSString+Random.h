//
//  NSString+Random.h
//  SearchTest
//
//  Created by Admin on 12.01.17.
//  Copyright © 2017 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

+ (NSString *)randomAlphanumericString;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;

@end
