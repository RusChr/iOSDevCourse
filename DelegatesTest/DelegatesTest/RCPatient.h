//
//  RCPatient.h
//  DelegatesTest
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"


@protocol RCPatientDelegate;



@interface RCPatient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) BOOL headache;
@property (weak, nonatomic) id <RCPatientDelegate> delegate;

- (BOOL)howAreYou;
- (void)takePill;
- (void)makeShot;
- (BOOL)wasWorse;

@end



@protocol RCPatientDelegate

- (void)patientFeelsBad:(RCPatient *)patient;
- (void)patient:(RCPatient *)patient hasQuestion:(NSString *)question;

@end