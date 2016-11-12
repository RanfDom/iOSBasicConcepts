//
//  ContactViewController.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactViewController.h"
#import "BeanContact.h"

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
    BeanContact *contact = [BeanContact new];
    [contact setContactInfoWithName:self.nameField.text withPhone:self.phoneField.text andEmail:self.mailField.text];
    [self.presenter saveAction:contact];
}

#pragma mark - SaveViewDelegate
- (void)showSuccesMessage
{
    
}

- (void)showInvalidInfoMessage
{
    
}

- (void)showErrorMessage
{
    
}

- (void)clearView
{
    
}

@end
