//
//  ListContactsViewProtocol.h
//  iOSBasic
//
//  Created by RanfeDom on 11/19/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//
#import "ContactEntity.h"

@protocol ListContactsViewProtocolDelegate <NSObject>
@required
- (void) loadViewWith:(NSArray *)data;
- (void) showContactDeail:(ContactEntity *)contact;
@end
