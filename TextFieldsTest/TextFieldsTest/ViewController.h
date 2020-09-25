//
//  ViewController.h
//  TextFieldsTest
//
//  Created by Admin on 26.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

- (IBAction)actionLog:(UIButton *)sender;
- (IBAction)actionTextChanged:(UITextField *)sender;

@end

