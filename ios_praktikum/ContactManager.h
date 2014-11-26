//
//  ContactManager.h
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "Contact.h"

@interface ContactManager : NSObject

@property (nonatomic, strong) NSMutableArray *contacts;

-(void)addContact:(Contact*)contact;
-(void)printList;

@end
