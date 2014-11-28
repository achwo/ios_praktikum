//
//  ContactManager.h
//  aufgabe1
//
//  Created by Felix Jensen on 29.10.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "Contact.h"

@interface ContactManager : NSObject

@property (nonatomic, strong) NSMutableArray *contacts;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)addContact:(NSString*)firstname withLastname:(NSString*)lastname andMail:(NSString*)mail;
- (void)changeContact:(Contact*)contact;
- (Contact*)getContact:(NSInteger)index;
- (NSUInteger)size;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;



@end
