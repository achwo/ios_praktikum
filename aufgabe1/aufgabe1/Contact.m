//
//  Contact.m
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Contact.h"

@implementation Contact

-(id)init
{
    if (self = [super init]) {
        _firstname = @"Vorname";
        _lastname = @"Nachname";
        _email = @"vorname@nachname";
    }
    return self;
}

@end