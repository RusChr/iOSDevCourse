//
//  AppDelegate.m
//  ArraysTest
//
//  Created by Admin on 31.03.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "AppDelegate.h"
#import "RCObject.h"
#import "RCChild.h"

#import "RCHuman.h"
#import "RCCyclist.h"
#import "RCRunner.h"
#import "RCSwimmer.h"
#import "RCStudent.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    NSArray *array = [[NSArray alloc] initWithObjects:@"String 1", @"String 2", @"String 3", nil]; // Можно и так объявлять массив.
//    NSArray *array = @[@"String 1", @"String 2", @"String 3"];                                     // Или так!
//    NSArray *array = [NSArray arrayWithObjects:@"String 1", @"String 2", @"String 3", nil];        // Или так!
    

//    for (int i = 0; i < [array count]; i++) {
//        NSLog(@"%@", [array objectAtIndex:i]);
//    }
    
//    for (int i = [array count] - 1; i >= 0; i--) {
//        NSLog(@"%@", [array objectAtIndex:i]);
//    }

//    for (NSString *obj in array) {
//        NSLog(@"%@", obj);
//        NSLog(@"index = %lu", [array indexOfObject:obj]);
//    }
    
    
    RCObject *obj1 = [[RCObject alloc] init];
    RCObject *obj2 = [[RCObject alloc] init];
    RCChild *obj3 = [[RCChild alloc] init];
    
    obj1.name = @"Object 1"; // or [obj1 setName:@"Object 1"];
    obj2.name = @"Object 2"; // or [obj2 setName:@"Object 2"];
    obj3.name = @"Object 3"; // or [obj3 setName:@"Object 3"];
    
    obj3.lastName = @"Last Name";
    
    NSArray *array = [NSArray arrayWithObjects:obj1, obj2, obj3, nil];
    
    for (RCObject *obj in array) {
        NSLog(@"name = %@", obj.name);
        [obj action];
        
        if ([obj isKindOfClass:[RCChild class]]) {
            RCChild *child = (RCChild *)obj;
            NSLog(@"lastName = %@", child.lastName);
        }
    }
    
//    [obj1 action];
//    [obj2 action];
//    [obj3 action];
    

/****** HOMEWORK ******/
    NSLog(@"\n****** HOMEWORK ******");
    
    RCHuman *human = [[RCHuman alloc] init];
    RCCyclist *cyclist = [[RCCyclist alloc] init];
    RCRunner *runner = [[RCRunner alloc] init];
    RCSwimmer *swimmer = [[RCSwimmer alloc] init];
    RCStudent *student = [[RCStudent alloc] init];
    
    human.name = @"Человек";
    human.height = 1.9f;
    human.weight = 90.f;
    human.gender = @"M";
    
    cyclist.name = @"Велосипедист";
    cyclist.height = 1.75f;
    cyclist.weight = 69.f;
    cyclist.gender = @"W";
    
    runner.name = @"Бегун";
    runner.height = human.height;
    runner.weight = 80.f;
    runner.gender = human.gender;
    
    swimmer.name = @"Пловец";
    swimmer.height = 1.8f;
    swimmer.weight = runner.weight - 0.5f;
    swimmer.gender = runner.gender;
    
    student.name = @"Студент";
    student.height = 1.6f;
    student.weight = 50.f;
    student.gender = @"W";
    student.studentProperty1 = @"studProp1";
    student.studentProperty2 = @"studProp2";
    
    
    NSArray *humArray = [NSArray arrayWithObjects:human, cyclist, runner, swimmer, student, nil];
    
    for (RCHuman *hum in humArray) {
        NSLog(@"name = %@, height = %f, weight = %f, gender = %@",
              hum.name, hum.height, hum.weight, hum.gender);
        
        if ([hum isKindOfClass:[RCStudent class]]) {
            RCStudent *stud = (RCStudent *)hum;
            
            NSLog(@"studentProperty1 = %@, studentProperty2 = %@", stud.studentProperty1, stud.studentProperty2);
            
            [stud parentMovement];
            [stud movement];
            
        } else {
            [hum movement];
        }
        
        NSLog(@"\n");
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
