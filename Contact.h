//
//  Contact.h
//  ios_praktikum
//
//  Created by Felix Jensen on 10.12.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSString * image;

@end
