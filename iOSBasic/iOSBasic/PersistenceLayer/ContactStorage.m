//
//  ContactStorage.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactStorage.h"
#import <Backendless/Backendless.h>

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
        [self saveNewContact:contact];
        return YES;
    }
}

- (NSArray *)fetchContacts
{
    id<IDataStore> dataStore = [backendless.persistenceService of:[ContactEntity class]];
    BackendlessCollection *collection = [dataStore find:nil];
    contactsArray = [NSMutableArray arrayWithArray:collection.data];
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

-(void)saveNewContact:(ContactEntity *)contact
{
    Responder *responder = [Responder responder:self
                             selResponseHandler:@selector(responseHandler:)
                                selErrorHandler:@selector(errorHandler:)];
 
    id<IDataStore> dataStore = [backendless.persistenceService of:[ContactEntity class]];
    [dataStore save:contact responder:responder];
}

#pragma mark - responder
-(id)responseHandler:(id)response
{
    ContactEntity *contact = (ContactEntity *)response;
    [contactsArray addObject:contact];
    NSLog(@"%@", response);
    return response;
}

-(id)errorHandler:(Fault *)fault
{
    NSLog(@"%@", fault.detail);
    return fault;
}

@end
