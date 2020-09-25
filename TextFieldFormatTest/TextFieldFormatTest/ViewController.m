//
//  ViewController.m
//  TextFieldFormatTest
//
//  Created by Admin on 27.10.16.
//  Copyright © 2016 RusChr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSLog(@"textField text = %@", textField.text);
//    NSLog(@"shouldChangeCharactersInRange = %@", NSStringFromRange(range));
//    NSLog(@"replacementString = %@", string);
    
    NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([components count] > 1) {
        return NO;
    }
    
    NSString *resultString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"Result string = %@", resultString);
    
    //+XX (XXX) XXX-XXXX => XXXXXXXXXXXX
    NSArray *validComponents = [resultString componentsSeparatedByCharactersInSet:validationSet];
    resultString = [validComponents componentsJoinedByString:@""];
    
    NSLog(@"Result string fixed = %@", resultString);
    
    
    NSMutableString *newString = [NSMutableString string];
    
    static const int localNumberMaxLength = 7;
    static const int areaCodeMaxLength = 3;
    static const int countryCodeMaxLength = 1;
    //static - означает, что данная константа будет инициализирована только один раз (при повторном входе в этот метод, эта конст. уже будет существовать).
    
    if ([resultString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength) {
        return NO;
    }
    
    //XXXXXXXXXXXX => +XX (XXX) XXX-XXXX
    NSInteger localNumberLength = MIN([resultString length], localNumberMaxLength);
    
    if (localNumberLength > 0) {
        NSString *number = [resultString substringFromIndex:(int)[resultString length] - localNumberLength];
        [newString appendString:number];
        
        if ([newString length] > 3) {
            [newString insertString:@"-" atIndex:3];
        }
    }
    
    if ([resultString length] > localNumberMaxLength) {
        NSInteger areaCodeLength = MIN((int)[resultString length] - localNumberMaxLength, areaCodeMaxLength);
        NSRange areaRange = NSMakeRange((int)[resultString length] - localNumberMaxLength - areaCodeLength, areaCodeLength);
        NSString *area = [resultString substringWithRange:areaRange];
        
        area = [NSString stringWithFormat:@"(%@) ", area];
        [newString insertString:area atIndex:0];
    }
    
    if ([resultString length] > localNumberMaxLength + areaCodeMaxLength) {
        NSInteger countryCodeLength = MIN((int)[resultString length] - localNumberMaxLength - areaCodeMaxLength, countryCodeMaxLength);
        NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
        NSString *countryCode = [resultString substringWithRange:countryCodeRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        [newString insertString:countryCode atIndex:0];
    }
    
    textField.text = newString;
    
    return NO;
    
//    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@" ,?"];
//    NSArray *words = [resultString componentsSeparatedByCharactersInSet:set];
//    NSLog(@"words = %@", words);
    
//    return [resultString length] <= 10;
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField;


@end
