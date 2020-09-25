//
//  AppDelegate.m
//  BlocksTest
//
//  Created by Admin on 25.04.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "AppDelegate.h"
#import "RCObject.h"


typedef void (^OurTestBlockType)(void);
typedef void (^homeTestBlock)(NSString *);


@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlockType myTestBlock;
@property (strong, nonatomic) NSString *name;

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
//    [self testMethod];
    
    
    void (^testBlock)(void);
    
    testBlock = ^{
        NSLog(@"Test block");
    };
    
//    void (^testBlock)(void) = ^{ //Короткая запись объявления и инициализации блока.
//        NSLog(@"Test block");
//    };
    
    testBlock();
    
    
    
//    [self testMethodWithParams:@"testParam" value:1234];
    
    
    void (^testBlockWithParams)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
        NSLog(@"Test block with params: %@ and %li", string, intValue);
    };
    
    testBlockWithParams(@"testParam", 1234);
    
    
    
//    NSLog(@"%@", [self testMethodWithParamsAndReturnValue:@"testParam" value:1234]);
    
    
    NSString *(^testBlockWithParamsAndReturnValue)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue){
        return [NSString stringWithFormat:@"Test block with params and return value: %@ and %li", string, intValue];
    };
    
    NSString *resultOfBlock = testBlockWithParamsAndReturnValue(@"testParam", 1234);
    
    NSLog(@"%@", resultOfBlock);
    
    
    
    //Отличие блока от метода в том, что в блоке мы можем использовать "внешние" переменные. Пример ниже
    NSString *testString = @"HOW IS IT POSSIBLE???";
    
    __block NSInteger counter = 0; //Здесь __block - для того, чтобы мы могли менять переменную в блоке.
    
    void (^testBlock2)(void) = ^{
        NSLog(@"Test block2");
        NSLog(@"%@", testString);
        NSLog(@"%li", ++counter);
    };
    
    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    //########
    
    
   
    [self testBlocksMethod:^{
        NSLog(@"###### B L O C K  !!! ######");
    }];
    
    
    
    OurTestBlockType myBlock = ^{
        NSLog(@"My block of OurTestBlockType");
    };
    
    myBlock();
    
    
    
    OurTestBlockType myBlock2 = ^{
        NSLog(@"New block");
    };
    
    [self testBlockMethod2:myBlock2];
    
    
    
    RCObject *obj = [[RCObject alloc] init];
    obj.name = @"OBJECT";
    
    
    //При таком раскладе(ниже!) объект НЕ уничтожится!!!!
    
//    OurTestBlockType tb = ^{
//        NSLog(@"%@", obj.name);
//    };
//    
//    tb();

    
    __weak RCObject *weakObj = obj;
    
    self.myTestBlock = ^{
        NSLog(@"Call %@ from property", weakObj.name);
    };
    
    self.myTestBlock();
    

    
    
    self.name = @"Hello!";
    
    RCObject *obj1 = [[RCObject alloc] init];
    obj1.name = @"world";
    
    [obj1 myTestMethod:^{
        NSLog(@"%@", self.name); //Здесь self.name - проперти AppDelegate, а не RCObject!!!
    }];
    
    
    
    
    
/************* HOMEWORK ***************/
    NSLog(@"\nHOMEWORK");
    
    
    void (^homeBlock)(void) = ^{
        NSLog(@"homeBlock");
    };
    homeBlock();
    
    
    homeTestBlock homeBlock2 = ^(NSString *string) {
        NSLog(@"%@", string);
    };
    homeBlock2(@"homeBlock2");
    
    
    [self homeTestMethod:homeBlock2];
    
    
    
    
    return YES;
}





- (void)testMethod {
    NSLog(@"Test method!");
}


- (void)testMethodWithParams:(NSString *)string value:(NSInteger)intValue {
    NSLog(@"Test method with params: %@ and %li", string, intValue);
}


- (NSString *)testMethodWithParamsAndReturnValue:(NSString *)string value:(NSInteger)intValue {
    return [NSString stringWithFormat:@"Test method with params and return value: %@ and %li", string, intValue];
}


- (void)testBlocksMethod:(void (^)(void))block {
    NSLog(@"testBlocksMethod");
    
    block();
    block();
    block();
}


- (void)testBlockMethod2:(OurTestBlockType)block {
    NSLog(@"block call from testBlockMethod2 method.");
    block();
}


- (void)homeTestMethod:(homeTestBlock)block {
    NSLog(@"block call from homeTestMethod");
    block(@"homeBlock2!!!");
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
