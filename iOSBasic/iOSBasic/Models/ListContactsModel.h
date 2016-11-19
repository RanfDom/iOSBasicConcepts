//
//  ListContactsModel.h
//  iOSBasic
//
//  Created by RanfeDom on 11/19/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactEntity.h"

@interface ListContactsModel : NSObject

- (void) getContactsWithCompletition:(void (^)(NSArray *contactsArray))callback;

- (void) getContactUserBy:(NSString *)name completition:(void (^)(ContactEntity *contact))callback;

@end
