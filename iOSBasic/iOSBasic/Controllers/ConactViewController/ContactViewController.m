//
//  ContactViewController.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactEntity.h"

@interface ContactViewController ()
@property (nonatomic,strong)SaveContactPresenter *presenter;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [SaveContactPresenter new];
    [self.presenter setUpWithModel:[SaveContectModel new]];
    [self.presenter setViewDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
