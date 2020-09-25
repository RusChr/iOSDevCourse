//
//  AppDelegate.m
//  DictionaryTest
//
//  Created by Admin on 06.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "AppDelegate.h"
#import "RCStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"Petrov", @"lastName",
                                @"Vasiliy", @"name",
                                [NSNumber numberWithInt:26], @"age",
                                nil];
    
//    NSDictionary *dictioanry2 = [NSDictionary dictionaryWithObjectsAndKeys:<#(nonnull id), ...#>, nil]; // Можно и так создать Дикшинари
//    NSDictionary *dictionary3 = @{@"lastName": @"Petrov", @"name": @"Vasiliy", @"age": @26}; // Или так
    
    
    NSLog(@"%@", dictionary);
    
    
    NSLog(@"name = %@, lastName = %@, age = %li",
          [dictionary objectForKey:@"name"],
          [dictionary objectForKey:@"lastName"],
          [[dictionary objectForKey:@"age"] integerValue]);
    
    
    NSLog(@"count = %li", [dictionary count]);
    
    
    for (NSString *key in [dictionary allKeys]) {
        
        id obj = [dictionary objectForKey:key];  // Здесь id, т.к. мы допускаем, что не знаем, что хранится в Дикшинари
        
        NSLog(@"key = %@, value = %@", key, obj);
    }
    
    
/***** HOMEWORK *****/
    NSLog(@"\nHOMEWORK\n");
    
    RCStudent *student1 = [[RCStudent alloc] init];
    RCStudent *student2 = [[RCStudent alloc] init];
    RCStudent *student3 = [[RCStudent alloc] init];
    RCStudent *student4 = [[RCStudent alloc] init];
    RCStudent *student5 = [[RCStudent alloc] init];
    
    student1.name = @"studnent1";
    student1.lastName = @"student1LastName";
    student1.hello = @"student1Hello";
    
    student2.name = @"studnent2";
    student2.lastName = @"student2LastName";
    student2.hello = @"student2Hello";
    
    student3.name = @"studnent3";
    student3.lastName = @"student3LastName";
    student3.hello = @"student3Hello";
    
    student4.name = @"studnent4";
    student4.lastName = @"student4LastName";
    student4.hello = @"student4Hello";
    
    student5.name = @"studnent5";
    student5.lastName = @"student5LastName";
    student5.hello = @"student5Hello";
    
    
    NSDictionary *studentDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                       student1, [student1 studentID],
                                       student2, [student2 studentID],
                                       student3, [student3 studentID],
                                       student4, [student4 studentID],
                                       student5, [student5 studentID],
                                       nil];
    
    for (NSString *key in [studentDictionary allKeys]) {
        id object = [studentDictionary objectForKey:key];
        
        NSLog(@"key = %@, value = %@", key, object);
    }
    
    for (NSString *key in [studentDictionary allKeys]) {
        RCStudent *object = [studentDictionary objectForKey:key];
        
        NSLog(@"name = %@, lastName = %@, hello = %@", object.name, object.lastName, object.hello);
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
