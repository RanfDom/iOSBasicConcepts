//
//  ContactStorage.h
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactEntity.h"

@interface ContactStorage : NSObject
+ (instancetype)sharedInstance;
- (BOOL)storageContact:(ContactEntity *)contact;
- (NSArray *)fetchContacts;
- (ContactEntity *)findContactByName:(NSString *)name;
@end
