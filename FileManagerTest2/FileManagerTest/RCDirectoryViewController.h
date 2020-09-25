//
//  RCDirectoryViewController.h
//  FileManagerTest
//
//  Created by Admin on 05.12.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCDirectoryViewController : UITableViewController

@property (strong, nonatomic) NSString *path;

- (instancetype)initWithFolderPath:(NSString *)path;

@end
