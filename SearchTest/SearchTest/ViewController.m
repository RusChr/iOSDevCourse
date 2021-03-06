//
//  ViewController.m
//  SearchTest
//
//  Created by Admin on 12.01.17.
//  Copyright © 2017 RusChr. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Random.h"
#import "RCSection.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *namesArray;
@property (strong, nonatomic) NSArray *sectionsArray;
@property (strong, nonatomic) NSOperation *currentOperation;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        [array addObject:[[NSString randomAlphanumericString] capitalizedString]];
    }
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"self" ascending:YES];
    [array sortUsingDescriptors:@[sortDescriptor]];
    self.namesArray = array;
    [self generateSectionsInBackgroundFromArray:array withFilter:self.searchBar.text];
}

- (void)generateSectionsInBackgroundFromArray:(NSArray *)array withFilter:(NSString *)filterString
{
    [self.currentOperation cancel];
    
    __weak ViewController *weakSelf = self;
    self.currentOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSArray *sectionsArray = [weakSelf generateSectionsFromArray:array withFilter:filterString];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.sectionsArray = sectionsArray;
            [weakSelf.tableView reloadData];
            self.currentOperation = nil;
        });
    }];
    [self.currentOperation start];
}

- (NSArray *)generateSectionsFromArray:(NSArray *)array withFilter:(NSString *)filterString
{
    NSMutableArray *sectionsArray = [NSMutableArray array];
    NSString *currentLetter = nil;
    for (NSString *string in array) {
        if ([filterString length] > 0 && [string rangeOfString:filterString].location == NSNotFound) {
            continue;
        }
        NSString *firstLetter = [string substringToIndex:1];
        RCSection *section = nil;
        if (![currentLetter isEqualToString:firstLetter]) {
            section = [[RCSection alloc] init];
            section.sectionName = firstLetter;
            section.itemsArray = [NSMutableArray array];
            currentLetter = firstLetter;
            [sectionsArray addObject:section];
        } else {
            section = [sectionsArray lastObject];
        }
        [section.itemsArray addObject:string];
    }
    return sectionsArray;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDataSource

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *array = [NSMutableArray array];
    for (RCSection *section in self.sectionsArray) {
        [array addObject:section.sectionName];
    }
    return array;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sectionsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.sectionsArray objectAtIndex:section] sectionName];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RCSection *sec = [self.sectionsArray objectAtIndex:section];
    return [sec.itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    RCSection *section = [self.sectionsArray objectAtIndex:indexPath.section];
    NSString *name = [section.itemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = name;
    
    return cell;
}


#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"textDidChange %@", searchText);
    [self generateSectionsInBackgroundFromArray:self.namesArray withFilter:self.searchBar.text];
}









@end
