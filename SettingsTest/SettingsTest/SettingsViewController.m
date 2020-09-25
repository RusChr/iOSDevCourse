//
//  SettingsViewController.m
//  SettingsTest
//
//  Created by Admin on 28.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end


static NSString *kSettingsLogin           = @"login";
static NSString *kSettingsPassword        = @"password";
static NSString *kSettingsLevel           = @"level";
static NSString *kSettingsShadows         = @"shadows";
static NSString *kSettingsDetalization    = @"detalization";
static NSString *kSettingsSound           = @"sound";
static NSString *kSettingsMusic           = @"music";


@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSettings];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Notifications

- (void)notificationKeyboardWillShow:(NSNotification *)notification {
    NSLog(@"notificationKeyboardWillShow:\n%@", notification.userInfo);
}

- (void)notificationKeyboardWillHide:(NSNotification *)notification {
    NSLog(@"notificationKeyboardWillHide:\n%@", notification.userInfo);
}


#pragma mark - Save and Load

- (void)saveSettings {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
    [userDefaults setInteger:self.levelControl.selectedSegmentIndex forKey:kSettingsLevel];
    [userDefaults setBool:self.shadowsSwitch.isOn forKey:kSettingsShadows];
    [userDefaults setInteger:self.detalizationControl.selectedSegmentIndex forKey:kSettingsDetalization];
    [userDefaults setDouble:self.soundSlider.value forKey:kSettingsSound];
    [userDefaults setDouble:self.musicSlider.value forKey:kSettingsMusic];
    
    [userDefaults synchronize];
}

- (void)loadSettings {
    NSUserDefaults *userDefauls = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text = [userDefauls objectForKey:kSettingsLogin];
    self.passwordField.text = [userDefauls objectForKey:kSettingsPassword];
    self.levelControl.selectedSegmentIndex = [userDefauls integerForKey:kSettingsLevel];
    self.shadowsSwitch.on = [userDefauls boolForKey:kSettingsShadows];
    self.detalizationControl.selectedSegmentIndex = [userDefauls integerForKey:kSettingsDetalization];
    self.soundSlider.value = [userDefauls doubleForKey:kSettingsSound];
    self.musicSlider.value = [userDefauls doubleForKey:kSettingsMusic];
}


#pragma mark - Actions

- (IBAction)actionTextChanged:(UITextField *)sender {
    [self saveSettings];
}

- (IBAction)actionValueChanged:(id)sender {
    [self saveSettings];
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return NO;
}
















@end
