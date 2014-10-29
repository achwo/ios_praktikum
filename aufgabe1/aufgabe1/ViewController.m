//
//  ViewController.m
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)clickSave:(id)sender {
    Contact *contact = [[Contact alloc] init];
    contact.firstname = _fieldFirstname.text;
    contact.lastname = _fieldLastname.text;
    contact.mail = _fieldMail.text;
    
    [_contactManager addContact:contact];
    [_contactManager printList];
    
    _fieldFirstname.text = @"";
    _fieldLastname.text = @"";
    _fieldMail.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _contactManager = [[ContactManager alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
