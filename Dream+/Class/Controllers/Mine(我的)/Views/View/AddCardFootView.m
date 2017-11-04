//
//  AddCardFootView.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddCardFootView.h"

@implementation AddCardFootView

+(instancetype)addCardViewWithOwnNib{
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"AddCardFootView" owner:nil options:nil];
    return nibs.firstObject;
}

@end
