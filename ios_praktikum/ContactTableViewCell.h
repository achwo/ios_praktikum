//
//  ContactTableViewCell.h
//  ios_praktikum
//
//  Created by Felix Jensen on 26.11.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lastnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstnameLabel;

@end
