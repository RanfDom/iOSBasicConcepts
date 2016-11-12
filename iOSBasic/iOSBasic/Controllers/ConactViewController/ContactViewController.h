//
//  ContactViewController.h
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveContactPresenter.h"

@interface ContactViewController : UIViewController<SaveContactViewProtocolDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *mailField;

@end
