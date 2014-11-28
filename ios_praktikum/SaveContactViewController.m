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
    
    [self.delegate saveContact:_fieldFirstname.text withLastname:_fieldLastname.text andMail:_fieldMail.text];
    
    _fieldFirstname.text = @"";
    _fieldLastname.text = @"";
    _fieldMail.text = @"";
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
