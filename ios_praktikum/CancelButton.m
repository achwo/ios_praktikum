//
//  CancelButton.m
//  ios_praktikum
//
//  Created by Felix Jensen on 28.11.14.
//  Copyright (c) 2014 Felix Jensen. All rights reserved.
//

#import "CancelButton.h"

@implementation CancelButton

-(void) handleClick
{
    [self.delegate didClickButton:self];
}

@end
