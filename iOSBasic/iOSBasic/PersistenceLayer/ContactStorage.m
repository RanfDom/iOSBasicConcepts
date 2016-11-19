//
//  ContactStorage.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactStorage.h"

@implementation ContactStorage {
    NSMutableArray *contactsArray;
}

static ContactStorage *_sharedInstance = nil;
static dispatch_once_t onceToken = 0;

+ (instancetype)sharedInstance
{
    dispatch_once(&onceToken, ^{
        if (_sharedInstance == nil) {
            _sharedInstance = [[ContactStorage alloc] init];
        }
    });
    
    return _sharedInstance;
}

- (instancetype)init {
    contactsArray = [NSMutableArray new];
    return self;
}

#pragma mark - Public
- (BOOL)storageContact:(ContactEntity *)contact
{
    if ([self isContactInStorage:contact]) {
        return NO;
    } else {
        [contactsArray addObject:contact];
        return YES;
    }
}

- (NSArray *)fetchContacts
{
    return contactsArray;
}

- (ContactEntity *)findContactByName:(NSString *)name
{
    return [self getInfoFromName:name];
}

#pragma mark - Private
- (BOOL) isContactInStorage:(ContactEntity *)contact
{
    for (ContactEntity *innerContact in contactsArray) {
        if (
            [[innerContact getName] isEqualToString:[contact getName]] &&
            [[innerContact getPhone] isEqualToString:[contact getPhone]]  &&
            [[innerContact getEmail] isEqualToString:[contact getEmail]]
            ) {
            return YES;
        }
    }
    return NO;
}

- (ContactEntity *) getInfoFromName:(NSString *)name
{
    for (ContactEntity *contact in contactsArray) {
        if ([[contact getName] isEqualToString:name]) {
            return contact;
        }
    }
    
    return nil;
}

@end
