//
//  AppDelegate.h
//  ParametersTest
//
//  Created by Admin on 30.03.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ObjectRus;  //@class - это для того, чтобы просто указать компилятору, что такой класс существуюет; #import - когда нужны поля и методы из класса.

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) ObjectRus *object;


@end

