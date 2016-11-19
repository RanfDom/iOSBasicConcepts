//
//  SaveContactPresenter.h
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactEntity.h"
#import "SaveContectModel.h"
#import "SaveContactViewProtocol.h"

@interface SaveContactPresenter : NSObject<SaveContactModelProtocol>

@property (nonatomic,strong)id<SaveContactViewProtocolDelegate>viewDelegate;

- (void) setUpWithModel:(SaveContectModel *)model;
- (void) saveAction:(ContactEntity *)contact;

@end
