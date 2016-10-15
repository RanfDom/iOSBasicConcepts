//
//  ContactModel.h
//  iOSBasic
//
//  Created by RanfeDom on 10/15/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactModel : NSObject

- (void)setContactInfoWithName:(NSString *)name withPhone:(NSString *)phone andEmail:(NSString *)email;

- (NSString *)getName;

@end
