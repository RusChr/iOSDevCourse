//
//  ViewController.m
//  ButtonsTest
//
//  Created by Admin on 24.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger cnt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cnt = 0;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(50, 50, 200, 100);
    [button setBackgroundColor:[UIColor greenColor]];
    
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitle:@"Button Pressed" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30],
//                                 NSForegroundColorAttributeName: [UIColor orangeColor]};
//    
//    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"Button" attributes:attributes];
//    
//    [button setAttributedTitle:title forState:UIControlStateNormal];
    
//    UIEdgeInsets insets = UIEdgeInsetsMake(50, 50, 0, 0);
//    button.titleEdgeInsets = insets;
    
    [self.view addSubview:button];
    
    
    [button addTarget:self action:@selector(actionTest:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(actionTestOutside:) forControlEvents:UIControlEventTouchUpOutside];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)actionTest:(UIButton *)btn {
    NSLog(@"Button pressed inside %li times!", ++self.cnt);
}

- (void)actionTestOutside:(UIButton *) button {
    NSLog(@"Button pressed Outside!");
}



- (IBAction)actionTest2:(UIButton *)sender {
    NSLog(@"actionTest2 tag = %li", sender.tag);
    
    self.indicatorLable.text = [NSString stringWithFormat:@"%li", sender.tag];
}


@end
