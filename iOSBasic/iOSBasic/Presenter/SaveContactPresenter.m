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
    [self.model setDelegate:self];
}

- (void)saveAction:(ContactEntity *)contact
{
    [self.model saveContact:contact];
}

#pragma mark - model delegate
- (void)saveSucces {
    [self.viewDelegate showSuccesMessage];
    [self.viewDelegate clearView];
}

- (void)saveErrorInvalid {
    [self.viewDelegate showInvalidInfoMessage];
    [self.viewDelegate clearView];
}

- (void)saveErrorDuplicated {
    [self.viewDelegate showErrorMessage];
    [self.viewDelegate clearView];
}

@end
