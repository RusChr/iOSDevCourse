//
//  RCJumpers.h
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@protocol RCJumpers <NSObject>


@property (assign, nonatomic) CGFloat jumpHeight;

- (void)jump;


@optional

- (void)run;

@end
