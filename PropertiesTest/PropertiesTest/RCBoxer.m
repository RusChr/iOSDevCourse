//
//  RCBoxer.m
//  PropertiesTest
//
//  Created by Admin on 25.03.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "RCBoxer.h"

@interface RCBoxer ()                               //
                                                    //
@property (assign, nonatomic) NSInteger nameCount;  //Все эти строчки для сокрытия nameCount
                                                    //
@end                                                //


@implementation RCBoxer

@synthesize name = _name; //Без этого нельзя одновременно переопределять и сеттер, и геттер
                          //_name - это iVar переменная; прямой доступ к Проперти _name (работает только внутри класса)

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameCount = 0;
        self.name = @"Default";
        self.age = 1;
        self.height = 0.52f;
        self.weight = 5.f;
    }
    return self;
}

//Переопределение сеттера
- (void)setName:(NSString *)name {
    NSLog(@"setter setName: is called");
    _name = name;
}

//Переопределение геттера
- (NSString *)name {
    self.nameCount += 1;
    NSLog(@"name getter is called %lu times", self.nameCount);
    return _name;
}

- (NSInteger)age {
    NSLog(@"age getter is called");
    return _age;
}

- (NSInteger)howOldAreYou {
    return _age;
}

@end
