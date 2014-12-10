//
//  ViewController.m
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "SaveContactViewController.h"
#import "AppConstants.h"

@interface SaveContactViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblFirstname;
@property (weak, nonatomic) IBOutlet UILabel *lblLastname;
@property (weak, nonatomic) IBOutlet UILabel *lblMail;
@property (weak, nonatomic) IBOutlet UILabel *lblUrl;

@end

@implementation SaveContactViewController

- (IBAction)clickSave:(id)sender {
    
    if(_contact) {
        _contact.firstname = _fieldFirstname.text;
        _contact.lastname = _fieldLastname.text;
        _contact.mail = _fieldMail.text;
        _contact.image = _fieldUrl.text;
        
        [self.delegate changeContact:_contact];
    } else {
    
        [self.delegate saveContact:_fieldFirstname.text withLastname:_fieldLastname.text andMail:_fieldMail.text andUrl:_fieldUrl.text];
    
        _fieldFirstname.text = @"";
        _fieldLastname.text = @"";
        _fieldMail.text = @"";
        _fieldUrl.text = @"";
    
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.lblFirstname.text = NSLocalizedString(kFirstname, nil);
    self.lblLastname.text = NSLocalizedString(kLastname, nil);
    self.lblMail.text = NSLocalizedString(kMail, nil);
    self.lblUrl.text = NSLocalizedString(kUrl, nil);
    
    self.navigationItem.title = NSLocalizedString(kContact, nil);
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(clickSave:)];
    
    
    if (_contact) {
        _fieldFirstname.text = _contact.firstname;
        _fieldLastname.text = _contact.lastname;
        _fieldMail.text = _contact.mail;
        _fieldUrl.text = _contact.image;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
