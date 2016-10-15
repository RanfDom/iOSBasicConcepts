//
//  ViewController.m
//  iOSBasic
//
//  Created by RanfeDom on 10/7/16.
//  Copyright © 2016 RanfeDom. All rights reserved.
//

#import "ViewController.h"
#import "ContactModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*NSString *myString = @"Hola Mundo";
    NSLog(@"My Log: %@",myString);
    
    NSArray *myArr = @[@"hola",@"como",@"estás"];
    NSLog(@"My Array: %@",[myArr objectAtIndex:0]);
    
    NSString *greetingString = [NSString stringWithFormat:@"%@ %@ %@",myArr[0],myArr[1],myArr[2]];
    
    NSDictionary *myDictionary = @{
                                   @"Key 1" : @"El coche de Jony",
                                   @"Key 2" : @"El coche de Luis",
                                   @"Key 3" : @"El coche de Cesar",
                                   @"Key 4" : @"El coche de Kevin",
                                   };
    
    NSLog(@"DictionaryKey %@",[myDictionary allKeys]);
    NSLog(@"Dict info %@",myDictionary[@"Key 1"]);
    
    NSMutableArray *arrMutable = [[NSMutableArray alloc]initWithArray:myArr];
    [arrMutable addObject:@"Other object"];
    [arrMutable addObject:@"Last Object"];
    [arrMutable removeLastObject];
    NSLog(@"mutable Array: %@",arrMutable);
    
    NSMutableDictionary *dictMutable = [[NSMutableDictionary alloc]initWithDictionary:myDictionary];
    [dictMutable setValue:@"new value" forKey:@"key 500"];
    [dictMutable removeObjectForKey:@"key 500"];
    [dictMutable setValue:myArr forKey:@"array"];
    
    [self addUserToArrayWithName:@"Ranferi" andPhone:@"123456"];
    
    NSArray *usersNameArray = @[@"Juan", @"Paco", @"Pedro", @"Luis"];
    NSArray *usersPhoneArray = @[@"5524534", @"3456354", @"356564", @"3456345"];
    
    NSMutableArray *userArr = [[NSMutableArray alloc]init];
    
    for (id obj in usersNameArray){
        int i = (int)[usersNameArray indexOfObject:obj];
        [userArr addObject:[self addUserToArrayWithName:usersNameArray[i] andPhone:usersPhoneArray[i]]];
    }
    
    NSLog(@"user array: %@",userArr);*/
    
    ContactModel *contact = [[ContactModel alloc] init];
    [contact setContactInfoWithName:@"Ranferi" withPhone:@"658769434" andEmail:@"ranferi.dr@gmail.com"];
    NSLog(@"Contacto :%@",[contact getName]);
}

- (NSDictionary *)addUserToArrayWithName:(NSString *)name andPhone:(NSString *)phone {
    
    NSDictionary *userInfoDict = @{
                                   @"name":name,
                                   @"phone":phone
                                   };
    return userInfoDict;
    /* Al termino de a ejecución se requiere un arreglo de diccionarios con la información de los usuarios */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveButtonAction{
    ContactModel *contact = [[ContactModel alloc] init];
    [contact setContactInfoWithName:self.nameTexField.text withPhone:self.phoneTextField.text andEmail:self.mailTextField.text];
    NSLog(@"Contacto :%@",[contact getName]);
}

@end
