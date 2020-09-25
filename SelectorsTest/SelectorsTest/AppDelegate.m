//
//  AppDelegate.m
//  SelectorsTest
//
//  Created by Admin on 21.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "AppDelegate.h"
#import "RCObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //[self testMethod];
    
    //[self performSelector:@selector(testMethod)];
    SEL selector1 = @selector(testMethod);
    [self performSelector:selector1];
    
    //[self performSelector:@selector(testMethod:) withObject:@"testParam"];
    SEL selector2 = @selector(testMethod:);
    [self performSelector:selector2 withObject:@"testParam"];
    
    //[self performSelector:@selector(testMethod:parameter2:) withObject:@"parameter1" withObject:@"parameter2"];
    SEL selector3 = @selector(testMethod:parameter2:);
    [self performSelector:selector3 withObject:@"parameter1" withObject:@"parameter2"];
    
    [self performSelector:selector1 withObject:nil afterDelay:5.f]; //Vyzov selector1 4erez 5 sec
    
    
    RCObject *obj = [[RCObject alloc] init];
    
    //[obj performSelector:@selector(testMethod)];
    [obj performSelector:selector1];
    
    
    
    
    return YES;
}


- (void)testMethod {
    NSLog(@"Test Method");
}

- (void)testMethod:(NSString *)string {
    NSLog(@"Test Method with param = %@", string);
}

- (void)testMethod:(NSString *)string parameter2:(NSString *)string2 {
    NSLog(@"Test Method with param1 = %@ and param2 = %@", string, string2);
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
