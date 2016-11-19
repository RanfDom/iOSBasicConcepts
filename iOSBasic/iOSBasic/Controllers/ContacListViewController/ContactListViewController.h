//
//  ContactListViewController.h
//  iOSBasic
//
//  Created by RanfeDom on 10/22/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListContactPresenter.h"

@interface ContactListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ListContactsViewProtocolDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableContacts;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIView *detailView;

@property (weak, nonatomic) IBOutlet UIButton *closeDetalButton;
@property (weak, nonatomic) IBOutlet UILabel *nameDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailDetailLabel;

@property (strong, nonatomic) ListContactPresenter *presenter;

@end
