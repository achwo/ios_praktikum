//
//  ViewController.h
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactManager.h"

@class ViewController;

@protocol SaveContactDelegate<NSObject>

-(void)saveContact:(NSString*)firstname withLastname:(NSString*)lastname andMail:(NSString*)mail;

@end

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fieldFirstname;
@property (weak, nonatomic) IBOutlet UITextField *fieldLastname;
@property (weak, nonatomic) IBOutlet UITextField *fieldMail;
@property (weak, nonatomic) IBOutlet UIButton *btnSaveContact;

@property(nonatomic, strong) id<SaveContactDelegate> delegate;

@end

