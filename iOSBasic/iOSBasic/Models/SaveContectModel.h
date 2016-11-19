//
//  SaveContectModel.h
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactEntity.h"

@protocol SaveContactModelProtocol <NSObject>
@required
- (void)saveSucces;
- (void)saveErrorInvalid;
- (void)saveErrorDuplicated;
@end

@interface SaveContectModel : NSObject
@property (nonatomic, strong)id <SaveContactModelProtocol>delegate;
- (void) saveContact:(ContactEntity *)contact;

@end
