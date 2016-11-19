//
//  SaveContectModel.h
//  iOSBasic
//
//  Created by RanfeDom on 11/12/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactEntity.h"

@interface SaveContectModel : NSObject

- (void) saveContact:(ContactEntity *)contact completition: (void (^)(int reponse))callback;

@end
