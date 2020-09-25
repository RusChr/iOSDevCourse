//
//  ViewController.m
//  FontsTest
//
//  Created by Admin on 03.11.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableview.contentInset = inset;
    self.tableview.scrollIndicatorInsets = inset;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIColor *)randomColor {
    CGFloat r = (arc4random() % 256) / 255.f;
    CGFloat g = (arc4random() % 256) / 255.f;
    CGFloat b = (arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
    
    return [[UIFont familyNames] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection %li", section);
    
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = [familyNames objectAtIndex:section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    return [fontNames count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = [familyNames objectAtIndex:section];
    
    return familyName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath: {%li, %li}", indexPath.section, indexPath.row);
    
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"cell created");
    } else {
        NSLog(@"cell reused");
    }
    
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = [familyNames objectAtIndex:indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = [fontNames objectAtIndex:indexPath.row];
    UIFont *font = [UIFont fontWithName:fontName size:16];
    
    cell.textLabel.textColor = [self randomColor];
    //cell.backgroundColor = [self randomColor];
    cell.textLabel.font = font;
    cell.textLabel.text = fontName;
    
    return cell;
}



@end
