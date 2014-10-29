//
//  ContactManager.m
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactManager.h"


@implementation ContactManager

-(id)init
{
    if(self = [super init])
    {
        _contacts = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addContact:(Contact*)contact
{
    [_contacts addObject:(Contact*)contact];
}

-(void)printList
{
    for(Contact* contact in _contacts)
    {
        NSLog(@"%@ %@, %@", contact.firstname, contact.lastname, contact.mail);
    }
}

@end