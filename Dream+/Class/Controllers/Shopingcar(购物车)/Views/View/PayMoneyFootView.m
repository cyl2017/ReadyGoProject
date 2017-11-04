//
//  PayMoneyFootView.m
//  Dream+
//
//  Created by macbook on 2017/10/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PayMoneyFootView.h"

@implementation PayMoneyFootView

+(instancetype)PayMoneyFootViewWithOwnNib{
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"PayMoneyFootView" owner:nil options:nil];
    return nibs.firstObject;
}

@end
