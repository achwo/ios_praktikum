//
//  CancelButton.h
//  ios_praktikum
//
//  Created by Felix Jensen on 28.11.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CancelButton;

@protocol CancelButtonDelegate<NSObject>

-(void)didClickButton:(CancelButton*)button;

@end

@interface CancelButton : NSObject
@property(nonatomic, strong) id<CancelButtonDelegate> delegate;
@end
