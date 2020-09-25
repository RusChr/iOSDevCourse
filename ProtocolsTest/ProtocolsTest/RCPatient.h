//
//  RCPatient.h
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RCPatient <NSObject>


@property (strong, nonatomic) NSString *name;

- (BOOL)areYouOK;
- (void)takePill;
- (void)makeShot;


@optional

- (NSString *)howIsYourFamily;
- (NSString *)howIsYourJob;


@end