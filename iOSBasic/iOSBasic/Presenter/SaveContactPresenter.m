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

- (void)saveAction:(BeanContact *)contact
{
    [self.model saveContact:contact];
}

@end
