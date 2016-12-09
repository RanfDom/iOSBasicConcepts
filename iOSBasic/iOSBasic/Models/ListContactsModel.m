//
//  ListContactsModel.m
//  iOSBasic
//
//  Created by RanfeDom on 11/19/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ListContactsModel.h"
#import "ContactStorage.h"
#import "Constants.h"

@implementation ListContactsModel

- (void)getContactsWithCompletition:(void (^)(NSArray *))callback
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[]];
    
    for (ContactEntity *contact in [[ContactStorage sharedInstance]fetchContacts]) {
        
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject:[contact getName] forKey:@"name"];
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        
        if ([userDefault boolForKey:showPhoneKey]){
            [dict setObject:[contact getPhone] forKey:@"phone"];
        }
        
        [array addObject:dict];
    }
    
    callback(array);
}

- (void)getContactUserBy:(NSString *)name completition:(void (^)(ContactEntity *))callback
{
    callback([[ContactStorage sharedInstance]findContactByName:name]);
}

@end
