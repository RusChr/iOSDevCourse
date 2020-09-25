//
//  RCSwimmers.h
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@protocol RCSwimmers <NSObject>


@property (assign, nonatomic) CGFloat swimSpeed;

- (void)swim;


@optional

- (void)dive;

@end
