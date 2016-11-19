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

- (void)saveContact:(ContactEntity *)contact completition:(void (^)(int))callback
{
    self.contact = contact;
    
    if ([self isValidContact]) {
        NSLog(@"valid contact");
        callback ([self addContact] ? 1 : 2);
        
    } else {
        NSLog(@"not valid contact");
        callback (0);
    }

}

#pragma mark - private

- (BOOL) isValidContact // 0 no valido, 1 valido
{
    return (
            [self.contact getName] &&
            [self.contact getPhone] &&
            [self.contact getEmail]) ? YES : NO ;
}

- (BOOL)addContact // 1 success , 0 Error
{
    return [[ContactStorage sharedInstance]storageContact:self.contact];
}

@end
