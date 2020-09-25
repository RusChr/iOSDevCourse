//
//  ViewController.h
//  SearchTest
//
//  Created by Admin on 12.01.17.
//  Copyright © 2017 RusChr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

