//
//  ViewController.m
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "SaveContactViewController.h"

@interface SaveContactViewController ()
@end

@implementation SaveContactViewController

- (IBAction)clickSave:(id)sender {
    
    if(_contact) {
        _contact.firstname = _fieldFirstname.text;
        _contact.lastname = _fieldLastname.text;
        _contact.mail = _fieldMail.text;
        
        [self.delegate saveContact:_contact];
    } else {
    
        [self.delegate saveContact:_fieldFirstname.text withLastname:_fieldLastname.text andMail:_fieldMail.text];
    
        _fieldFirstname.text = @"";
        _fieldLastname.text = @"";
        _fieldMail.text = @"";
    
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_contact) {
        _fieldFirstname.text = _contact.firstname;
        _fieldLastname.text = _contact.lastname;
        _fieldMail.text = _contact.mail;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
