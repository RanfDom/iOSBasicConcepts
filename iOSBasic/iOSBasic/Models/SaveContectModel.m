//
//  SaveContectModel.m
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "SaveContectModel.h"

@interface SaveContectModel ()
@property (nonatomic, strong)BeanContact *contact;
@end

@implementation SaveContectModel

#pragma mark - public

- (void)saveContact:(BeanContact *)contact
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
    return YES;
}

- (BOOL)addContact
{
    return YES;
}

@end
