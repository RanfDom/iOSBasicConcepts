//
//  ListContactsModel.m
//  iOSBasic
//
//  Created by RanfeDom on 11/19/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ListContactsModel.h"
#import "ContactStorage.h"

@implementation ListContactsModel

- (void)getContactsWithCompletition:(void (^)(NSArray *))callback
{
    callback([[ContactStorage sharedInstance]fetchContacts]);
}

- (void)getContactUserBy:(NSString *)name completition:(void (^)(ContactEntity *))callback
{
    callback([[ContactStorage sharedInstance]findContactByName:name]);
}

@end
