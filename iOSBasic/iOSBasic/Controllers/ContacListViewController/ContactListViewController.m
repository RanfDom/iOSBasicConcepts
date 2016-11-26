//
//  ContactListViewController.m
//  iOSBasic
//
//  Created by RanfeDom on 10/22/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactListViewController.h"
#import "ListContactsModel.h"
//#import "ContactModel.h"

@interface ContactListViewController ()
@property (nonatomic,strong)NSArray *contentArray;
@end

@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.presenter =  [[ListContactPresenter alloc]initWith:[ListContactsModel new]];
    [self.presenter setViewDelegate:self];
    
    [_backButton addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
    
    [_tableContacts setDataSource:self];
    [_tableContacts setDelegate:self];
    
    [_detailView setHidden:YES];
    [self.presenter loadData];
}

#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.presenter cellPressedWithInfo:[self.contentArray[indexPath.row] getName]];
}

#pragma mark - TableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_contentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    cell.textLabel.text = [self.contentArray[indexPath.row] objectForKey:@"name"];
    cell.detailTextLabel.text = [self.contentArray[indexPath.row] objectForKey:@"phone"];
    return cell;
}

#pragma mark - PrivateMethods
- (void)hideView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ViewDelegates

- (void)loadViewWith:(NSArray *)data {
    self.contentArray = data;
    [self.tableContacts reloadData];
}

- (void)showContactDeail:(ContactEntity *)contact {
    
    self.nameDetailLabel.text = [contact getName];
    self.phoneDetailLabel.text = [contact getPhone];
    self.emailDetailLabel.text = [contact getEmail];
    
    [UIView animateWithDuration:0.5 animations:^{
        [_detailView setHidden:NO];
    }];
}

@end
