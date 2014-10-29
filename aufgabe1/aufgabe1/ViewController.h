//
//  ViewController.h
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactManager.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fieldFirstname;
@property (weak, nonatomic) IBOutlet UITextField *fieldLastname;
@property (weak, nonatomic) IBOutlet UITextField *fieldMail;
@property (weak, nonatomic) IBOutlet UIButton *btnSaveContact;

@property (strong, nonatomic) ContactManager *contactManager;

@end

