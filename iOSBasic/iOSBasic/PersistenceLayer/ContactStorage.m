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

#pragma mark - Private
- (BOOL) isContactInStorage:(ContactEntity *)contact
{
    for (ContactEntity *innerContact in contactsArray) {
        if ([innerContact getName] == [contact getName] &&
            [innerContact getPhone] == [contact getPhone] &&
            [innerContact getEmail] == [contact getEmail]
            ) {
            return YES;
        }
    }
    return NO;
}

@end
