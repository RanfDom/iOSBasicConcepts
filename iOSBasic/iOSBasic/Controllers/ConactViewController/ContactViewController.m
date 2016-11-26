//
//  ContactViewController.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactEntity.h"
#import "Constants.h"

@interface ContactViewController ()
@property (nonatomic,strong)SaveContactPresenter *presenter;
@end

@implementation ContactViewController {
    UITextField *activeTextField;
}

enum {
    nameTag,
    phoneTag,
    emailTag,
};

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [SaveContactPresenter new];
    [self.presenter setUpWithModel:[SaveContectModel new]];
    [self.presenter setViewDelegate:self];
    
    [self.nameField setKeyboardType:UIKeyboardTypeDefault];
    [self.phoneField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.mailField setKeyboardType:UIKeyboardTypeEmailAddress];
    
    [self.nameField setTag:nameTag];
    [self.phoneField setTag:phoneTag];
    [self.mailField setTag:emailTag];
    
    self.nameField.delegate = self;
    self.phoneField.delegate = self;
    self.mailField.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private
- (void)hideKeyboard {
    if (activeTextField) {
        [activeTextField resignFirstResponder];
        activeTextField = nil;
    }
}

#pragma mark - TextFieldDelegates
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    activeTextField = textField;
    
    switch ([textField tag]) {
        case nameTag:
        {
            [textField setTextColor:[UIColor redColor]];
        }
            break;
        case phoneTag:
        {
            [textField setTextColor:[UIColor blueColor]];
        }
            break;
            
        case emailTag:
        {
            [textField setTextColor:[UIColor greenColor]];
        }
            break;
            
        default:
            break;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField setTextColor:[UIColor blackColor]];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([textField tag] == nameTag) {
        NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"1234567890"];
        
        for (int i =0 ; i<string.length ; i++) {
            unichar c = [string characterAtIndex:i];
            if ([charSet characterIsMember:c]) {
                return NO;
            }
        }
    }
    
    if ([textField tag] == phoneTag){
        return (textField.text.length<phoneLenght);
    }
    return YES;
}


#pragma mark - buttons action
- (IBAction)lisrContactsAction:(id)sender {
}

- (IBAction)saveContactAction:(id)sender {
    ContactEntity *contact = [ContactEntity new];
    [contact setContactInfoWithName:self.nameField.text withPhone:self.phoneField.text andEmail:self.mailField.text];
    [self.presenter saveAction:contact];
}

#pragma mark - SaveViewDelegate
- (void)showSuccesMessage
{
    NSLog(@"Contact Added");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Aviso" message:@"Contacto guardado sactisfactoriamente" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showInvalidInfoMessage
{
    NSLog(@"Invalid Info");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Aviso" message:@"Complete los campos faltantes" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)showErrorMessage
{
    NSLog(@"Duplicated");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Aviso" message:@"Contacto duplicado" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)clearView
{
    self.nameField.text = @"";
    self.phoneField.text = @"";
    self.mailField.text = @"";
}

@end
