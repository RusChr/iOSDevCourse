//
//  AppDelegate.m
//  TypesTest
//
//  Created by Admin on 04.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "AppDelegate.h"
#import "RCStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    BOOL boolVar = YES;
//    
//    NSInteger intVar = 10;
//    
//    NSUInteger uIntVar = 100;
//    
//    CGFloat floatVar = 1.5f;
//    
//    double doubleVar = 2.6f;
//    
//    
//    NSLog(@"boolVar = %d, intVar = %li, uIntVal = %lu, floatVar = %f, doubleVar = %f",
//          boolVar, intVar, uIntVar, floatVar, doubleVar);
//    
//    NSLog(@"sizeof boolVar = %lu, sizeof intVar = %lu, sizeof uIntVal = %lu, sizeof floatVar = %lu, sizeof doubleVar = %lu",
//          sizeof(boolVar), sizeof(intVar), sizeof(uIntVar), sizeof(floatVar), sizeof(doubleVar));
    
    
//    RCStudent *studentA = [[RCStudent alloc] init];
//    
//    studentA.name = @"Best student";
//    
//    NSLog(@"StudentA name = %@", studentA.name);
//    
//    
//    RCStudent *studentB = studentA;
//    
//    studentB.name = @"Bad student";
//    
//    NSLog(@"StudentA name = %@", studentA.name);
    
    
//    NSInteger a = 10;
//    
//    NSLog(@"a = %li", a);
//    
//    NSInteger b = a;
//    
//    b = 5;
//    
//    NSLog(@"a = %li, b = %li", a, b);
//    
//    NSInteger *c = &a;
//    
//    *c = 8;
//    
//    NSLog(@"a = %li, b = %li", a, b);
    
    
//    RCStudent *student = [[RCStudent alloc] init];
//    student.gender = RCGenderMale;
    
    
//    RCTaburetka tab = 10;
    
    
//    CGPoint point;
//    
//    point.x = 5.2f;
//    point.y = 8;
//    
//    point = CGPointMake(5, 3);
//    
//    
//    CGSize size;
//    
//    size.height = 2.8f;
//    size.width = 4.1f;
//    
//    size = CGSizeMake(2, 4);
//    
//    
//    CGRect rect;
//    
//    rect.size = size;
//    rect.origin = point;
//    
//    rect = CGRectMake(0, 0, 30, 60);
//    
//    
//    BOOL result = CGRectContainsPoint(rect, point);
    
    
    BOOL boolVar = YES;
    NSInteger intVar = 10;
    NSUInteger uIntVar = 100;
    CGFloat floatVar = 1.5f;
    double doubleVar = 2.6f;
    
    //NSArray *array = [NSArray arrayWithObjects:boolVar, intVar, uIntVar, floatVar, doubleVar, nil]; // Не работает, т.к. boolVar, intVar, uIntVar и т.д. - не являются объектами. Чтобы работали, нужно завернуть их в оболочку, как показано ниже
    
    NSNumber *boolObject = [NSNumber numberWithBool:boolVar];
    NSNumber *intObject = [NSNumber numberWithInteger:intVar];
    NSNumber *uIntObject = [NSNumber numberWithUnsignedInteger:uIntVar];
    NSNumber *floatObject = [NSNumber numberWithFloat:floatVar];
    NSNumber *doubleObject = [NSNumber numberWithDouble:doubleVar];
    
    NSArray *array = [NSArray arrayWithObjects:boolObject, intObject, uIntObject, floatObject, doubleObject, nil];
    
    // Т.к. теперь в массиве только NSNumber, то для обратного преобразования используем следующую тему
    NSLog(@"boolVar = %d, intVar = %li, uIntVal = %lu, floatVar = %f, doubleVar = %f",
          [[array objectAtIndex:0] boolValue],
          [[array objectAtIndex:1] integerValue],
          [[array objectAtIndex:2] unsignedIntegerValue],
          [[array objectAtIndex:3] floatValue],
          [[array objectAtIndex:4] doubleValue]);
    
    
    
    CGPoint point1 = CGPointMake(0, 5);
    CGPoint point2 = CGPointMake(3, 4);
    CGPoint point3 = CGPointMake(2, 8);
    CGPoint point4 = CGPointMake(7, 1);
    CGPoint point5 = CGPointMake(4, 4);
    
    NSArray *array2 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:point1],
                       [NSValue valueWithCGPoint:point2],
                       [NSValue valueWithCGPoint:point3],
                       [NSValue valueWithCGPoint:point4],
                       [NSValue valueWithCGPoint:point5],
                       nil];
    
    for (NSValue *value in array2) {
        CGPoint p = [value CGPointValue];
        NSLog(@"point = %@", NSStringFromCGPoint(p));
    }
    
    
/****** HOMEWORK ******/
    NSLog(@"\n HOMEWORK \n");
    
    CGRect rect = CGRectMake(3, 3, 3, 3);
    
    for (int i = 0; i < 100; i++) {
        
        NSInteger x = arc4random() % 11;
        NSInteger y = arc4random() % 11;
        
        CGPoint point = CGPointMake(x, y);
        NSValue *pnt = [NSValue valueWithCGPoint:point];
        CGPoint p = [pnt CGPointValue];
        
        BOOL goal = CGRectContainsPoint(rect, point);
        
        if (goal) {
            NSLog(@"point = %@ GOAL!!!", NSStringFromCGPoint(p));
        } else {
            NSLog(@"point = %@", NSStringFromCGPoint(p));
        }
    }

    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
