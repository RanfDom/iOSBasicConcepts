//
//  ContactListViewController.h
//  iOSBasic
//
//  Created by RanfeDom on 10/22/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactListViewController : UIViewController<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableContacts;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (void)setArrayContacts:(NSArray *)array;
@end
