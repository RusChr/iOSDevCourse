//
//  RCDirectoryViewController.m
//  FileManagerTest
//
//  Created by Admin on 05.12.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

//@"/Users/admin/Yandex.Disk.localized/iOSDevCourse2"

#import "RCDirectoryViewController.h"

@interface RCDirectoryViewController ()

@property (strong, nonatomic) NSArray *contents;

@end

@implementation RCDirectoryViewController

- (instancetype)initWithFolderPath:(NSString *)path
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.path = path;
    }
    return self;
}


- (void)setPath:(NSString *)path
{
    _path = path;
    NSError *error = nil;
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    [self.tableView reloadData];
    self.navigationItem.title = [self.path lastPathComponent];
}


- (void)dealloc
{
    NSLog(@"controller with path %@ has been deallocated!", self.path);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.path) {
        self.path = @"/Users/admin/Yandex.Disk.localized/iOSDevCourse2";
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    if ([self.navigationController.viewControllers count] > 1) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"back to Root"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(actionBackToRoot:)];
        self.navigationItem.rightBarButtonItem = item;
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"path = %@", self.path);
    NSLog(@"view controllers on stack = %li", [self.navigationController.viewControllers count]);
    NSLog(@"index on stack = %li\n\n", [self.navigationController.viewControllers indexOfObject:self]);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (BOOL)isDirectoryAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    NSString *filePath = [self.path stringByAppendingPathComponent:fileName];
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
}


#pragma mark - Actions -

- (void)actionBackToRoot:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    cell.textLabel.text = fileName;
    if ([self isDirectoryAtIndexPath:indexPath]) {
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"file.png"];
    }
    return cell;
}


#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self isDirectoryAtIndexPath:indexPath]) {
        NSString *fileName = [self.contents objectAtIndex:indexPath.row];
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        //RCDirectoryViewController *vc = [[RCDirectoryViewController alloc] initWithFolderPath:path];
        //[self.navigationController pushViewController:vc animated:YES];
        
        RCDirectoryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RCDirectoryViewController"];
        vc.path = path;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
