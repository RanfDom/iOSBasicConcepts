//
//  SaveContectModel.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "SaveContectModel.h"
#import "ContactStorage.h"

@interface SaveContectModel ()
@property (nonatomic, strong)ContactEntity *contact;
@end

@implementation SaveContectModel

#pragma mark - public

- (void)saveContact:(ContactEntity *)contact
{
    self.contact = contact;
    
    if ([self isValidContact]) {
        NSLog(@"valid contact");
        
//        if ([self addContact])
//        {
//            NSLog(@"added");
//            [self.delegate saveSucces];
//        } else {
//            NSLog(@"duplicated user");
//            [self.delegate saveErrorDuplicated];
//        }
        
        [self addContact] ?
        [self.delegate saveSucces] :
        [self.delegate saveErrorDuplicated];
        
    } else {
        NSLog(@"not valid contact");
        [self.delegate saveErrorInvalid];
    }
}

#pragma mark - private

- (BOOL) isValidContact
{
    return ([self.contact getName] && [self.contact getPhone] && [self.contact getEmail]) ? YES : NO ;
}

- (BOOL)addContact
{
    return [[ContactStorage sharedInstance]storageContact:self.contact];
}

@end
