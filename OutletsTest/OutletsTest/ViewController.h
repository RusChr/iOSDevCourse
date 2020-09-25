//
//  ViewController.h
//  OutletsTest
//
//  Created by Admin on 11.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//@property (weak, nonatomic) IBOutlet UIView *testView;
//@property (weak, nonatomic) IBOutlet UIView *testView2;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *testViews;

@end

