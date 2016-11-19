//
//  ListContactPresenter.m
//  iOSBasic
//
//  Created by RanfeDom on 11/19/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ListContactPresenter.h"

@interface ListContactPresenter()
@property (nonatomic, strong)ListContactsModel *model;
@end

@implementation ListContactPresenter

- (instancetype)initWith:(ListContactsModel *)model
{
    [self setModel:model];
    return self;
}

#pragma mark - public
- (void)loadData
{
    [self.model getContactsWithCompletition:^(NSArray *contactsArray) {
        [self.viewDelegate loadViewWith:contactsArray];
    }];
}

- (void) cellPressedWithInfo:(NSString *)name
{
    [self.model getContactUserBy:name completition:^(ContactEntity *contact) {
        [self.viewDelegate showContactDeail:contact];
    }];
}

@end
