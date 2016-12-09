//
//  ConfigurationViewController.m
//  iOSBasic
//
//  Created by RanfeDom on 11/26/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ConfigurationViewController.h"
#import "Constants.h"

@interface ConfigurationViewController ()

@end

@implementation ConfigurationViewController

- (IBAction)saveAction:(id)sender {
    
    BOOL show = ![[NSNumber numberWithInt:(int)[self.phoneSegment selectedSegmentIndex]]boolValue];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setBool:show forKey:showPhoneKey];
    [userDefault synchronize];
}

@end
