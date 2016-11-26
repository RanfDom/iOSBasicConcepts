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
    
    BOOL show;
    NSString *showInt;
    
    switch ([self.phoneSegment selectedSegmentIndex]) {
        case 0: {
            show = YES;
            showInt = @"yes";
        }
            break;
        case 1: {
            show = NO;
            showInt = @"no";
        }
            break;
        default:
            break;
    }
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:showInt forKey:@"showInt"];
    [userDefault setBool:show forKey:@"show"];
    [userDefault synchronize];
}

@end
