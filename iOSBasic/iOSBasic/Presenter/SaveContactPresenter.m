//
//  SaveContactPresenter.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "SaveContactPresenter.h"

@interface SaveContactPresenter()
@property (nonatomic, strong)SaveContectModel *model;
@end

@implementation SaveContactPresenter

- (void)setUpWithModel:(SaveContectModel *)model
{
    self.model = model;
}

- (void)saveAction:(ContactEntity *)contact
{

    [self.model saveContact:contact completition:^(int reponse) {
        switch (reponse) {
            case 0: { // Invalid
                [self.viewDelegate showInvalidInfoMessage];
            }
                break;
            case 1: { // Success
                [self.viewDelegate showSuccesMessage];
                [self.viewDelegate clearView];
            }
                break;
            case 2: { // Duplicated
                [self.viewDelegate showErrorMessage];
                [self.viewDelegate clearView];
            }
                break;
                
            default:
                break;
        }
    }];
}

@end
