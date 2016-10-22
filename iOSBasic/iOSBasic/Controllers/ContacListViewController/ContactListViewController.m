//
//  ContactListViewController.m
//  iOSBasic
//
//  Created by RanfeDom on 10/22/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactListViewController.h"
#import "ContactModel.h"

@interface ContactListViewController ()
@property (nonatomic,strong)NSArray *contentArray;
@end

@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_backButton addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
    [_tableContacts setDataSource:self];
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
    
    ContactModel *contact = _contentArray[indexPath.row];
    cell.textLabel.text = [contact getName];
    
    return cell;
}

#pragma mark - Segue Methods
- (void)setArrayContacts:(NSArray *)array{
    _contentArray = [[NSArray alloc] initWithArray:array];
    
    for (ContactModel *contact in _contentArray){
        NSLog(@"nombre: %@",[contact getName]);
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)hideView {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
