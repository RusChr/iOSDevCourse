//
//  ViewController.m
//  TextFieldsTest
//
//  Created by Admin on 26.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.firstNameField.keyboardAppearance = UIKeyboardAppearanceDark;
    //self.lastNameField.keyboardAppearance = UIKeyboardAppearanceLight;
    
    [self.firstNameField becomeFirstResponder];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidChangeEditing:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Actions

- (IBAction)actionLog:(UIButton *)sender {
    NSLog(@"First name = %@, Last name = %@", self.firstNameField.text, self.lastNameField.text);
}

- (IBAction)actionTextChanged:(UITextField *)sender {
    if ([sender isEqual:self.firstNameField]) {
        NSLog(@"first name = %@", sender.text);
    } else if ([sender isEqual:self.lastNameField]) {
        NSLog(@"last name = %@", sender.text);
    } else {
        NSLog(@"%@", sender.text);
    }
}


#pragma mark - UITextFieldDelegate
/*
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return [textField isEqual:self.firstNameField];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return NO;
}
*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}


#pragma mark - Notifications

- (void)notificationTextDidBeginEditing:(NSNotification *)notification {
    NSLog(@"notificationTextDidBeginEditing");
}

- (void)notificationTextDidEndEditing:(NSNotification *)notification {
    NSLog(@"notificationTextDidEndEditing");
}

- (void)notificationTextDidChangeEditing:(NSNotification *)notification {
    NSLog(@"notificationTextDidChangeEditing");
}


@end
