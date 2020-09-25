//
//  AppDelegate.m
//  DelegatesTest
//
//  Created by Admin on 07.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "AppDelegate.h"
#import "RCDoctor.h"
#import "RCPatient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    RCPatient *patient1 = [[RCPatient alloc] init];
    patient1.name = @"Vova";
    patient1.temperature = 36.6f;
    
    RCPatient *patient2 = [[RCPatient alloc] init];
    patient2.name = @"Petya";
    patient2.temperature = 40.2f;
    
    RCPatient *patient3 = [[RCPatient alloc] init];
    patient3.name = @"Dima";
    patient3.temperature = 37.1f;
    
    RCPatient *patient4 = [[RCPatient alloc] init];
    patient4.name = @"Sasha";
    patient4.temperature = 38.f;
    
    
    RCDoctor *doctor = [[RCDoctor alloc] init];
    
    patient1.delegate = doctor;
    patient2.delegate = doctor;
    patient3.delegate = doctor;
    patient4.delegate = doctor;
    
    
    NSLog(@"%@ are you ok? %@", patient1.name, [patient1 howAreYou] ? @"Yes" : @"No");
    NSLog(@"%@ are you ok? %@", patient2.name, [patient2 howAreYou] ? @"Yes" : @"No");
    NSLog(@"%@ are you ok? %@", patient3.name, [patient3 howAreYou] ? @"Yes" : @"No");
    NSLog(@"%@ are you ok? %@", patient4.name, [patient4 howAreYou] ? @"Yes" : @"No");
    
    
    
/******* HOMEWORK *******/
    
    NSLog(@"\n\tHOMEWORK");
    
    
    RCPatient *patient5 = [[RCPatient alloc] init];
    patient5.name = @"Timur";
    patient5.temperature = 38.4f;
    
    RCPatient *patient6 = [[RCPatient alloc] init];
    patient6.name = @"Imran";
    patient6.temperature = 36.9f;
    
    
    RCDoctor *doctor1 = [[RCDoctor alloc] init];
    
    patient5.delegate = doctor1;
    patient6.delegate = doctor1;
    
    
    NSArray *patients = [NSArray arrayWithObjects:patient1, patient2, patient3, patient4, patient5, patient6, nil];
    
    for (RCPatient *patient in patients) {
        NSLog(@"%@ are you ok? %@", patient.name, [patient howAreYou] ? @"Yes" : @"No");
        
        patient.headache = arc4random() % 2;
        
        if (patient.headache) {
            [patient wasWorse];
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
