//
//  ContactModel.m
//  iOSBasic
//
//  Created by RanfeDom on 10/15/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ContactEntity.h"

@interface ContactEntity()
@property(nonatomic,strong)NSString *objectId;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *email;
@end

@implementation ContactEntity

- (void)setContactInfoWithName:(NSString *)name withPhone:(NSString *)phone andEmail:(NSString *)email {
    self.name = name;
    self.phone = phone;
    self.email = email;
}

- (NSString *)getName {
    return self.name;
}

- (NSString *)getPhone {
    return  self.phone;
}

- (NSString *)getEmail {
    return self.email;
}
@end
