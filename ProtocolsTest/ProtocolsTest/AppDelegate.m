//
//  AppDelegate.m
//  ProtocolsTest
//
//  Created by Admin on 05.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "AppDelegate.h"
#import "RCPatient.h"
#import "RCDancer.h"
#import "RCDeveloper.h"
#import "RCStudent.h"
#import "RCJumpers.h"
#import "RCSwimmers.h"
#import "RCRunners.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    RCDancer *dancer1 = [[RCDancer alloc] init];
    RCDancer *dancer2 = [[RCDancer alloc] init];
    
    RCStudent *student1 = [[RCStudent alloc] init];
    RCStudent *student2 = [[RCStudent alloc] init];
    RCStudent *student3 = [[RCStudent alloc] init];
    
    RCDeveloper *developer1 = [[RCDeveloper alloc] init];
    
    
    dancer1.name = @"dancer 1";
    dancer2.name = @"dancer 2";
    
    student1.name = @"student 1";
    student2.name = @"student 2";
    student3.name = @"student 3";
    
    developer1.name = @"developer 1";
    
    NSObject *fake = [[NSObject alloc] init];
    
    
    NSArray *patients = [NSArray arrayWithObjects:dancer1, student1, fake, student2, developer1, student3, dancer2, nil];
    
    
    for (id <RCPatient> patient in patients) {
        
        //Проверяем, соответствует ли объект из массива протоколу RCPatient
        if ([patient conformsToProtocol:@protocol(RCPatient)]) {
            NSLog(@"Patient name = %@", patient.name);
            
            //Делаем проверку на срабатываение (реагирование) на наши опциональные методы
            if ([patient respondsToSelector:@selector(howIsYourFamily)]) {
                NSLog(@"How is your family? - %@", [patient howIsYourFamily]);
            }
            
            if ([patient respondsToSelector:@selector(howIsYourJob)]) {
                NSLog(@"How is your job? - %@", [patient howIsYourJob]);
            }
            //###
            
            if (![patient areYouOK]) {
                [patient takePill];
                
                if (![patient areYouOK]) {
                    [patient makeShot];
                }
            }
        } else {
            NSLog(@"FAKE!!!");
        }
    }
    
    
/***** HOMEWORK *****/
    NSLog(@"\n HOMEWORK 🤔 \n");
    
    
    developer1.jumpHeight = 3.4f;
    dancer1.runSpeed = 9.2f;
    dancer2.runSpeed = 8.8f;
    student1.swimSpeed = 1.1f;
    student2.swimSpeed = 0.9f;
    
    
    NSArray *sportsmen = [NSArray arrayWithObjects:developer1, dancer1, dancer2, student1, student2, nil];
    
    
    for (id <RCJumpers, RCSwimmers, RCRunners> sportsman in sportsmen) {
        if ([sportsman conformsToProtocol:@protocol(RCJumpers)]) {
            [sportsman jump];
            
            if ([sportsman respondsToSelector:@selector(run)]) {
                [sportsman run];
            }
        }
        
        if ([sportsman conformsToProtocol:@protocol(RCSwimmers)]) {
            [sportsman swim];
            
            if ([sportsman respondsToSelector:@selector(dive)]) {
                [sportsman dive];
            }
        }
        
        if ([sportsman conformsToProtocol:@protocol(RCRunners)]) {
            [sportsman run];
            
            if ([sportsman respondsToSelector:@selector(jump)]) {
                [sportsman jump];
            }
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
