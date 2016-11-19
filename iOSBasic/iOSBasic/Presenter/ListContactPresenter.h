//
//  ListContactPresenter.h
//  iOSBasic
//
//  Created by RanfeDom on 11/19/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListContactsViewProtocol.h"
#import "ListContactsModel.h"

@interface ListContactPresenter : NSObject

@property (nonatomic,strong)id<ListContactsViewProtocolDelegate>viewDelegate;

- (instancetype)initWith:(ListContactsModel *)model;
- (void) loadData;
- (void) cellPressedWithInfo:(NSString *)name;

@end
