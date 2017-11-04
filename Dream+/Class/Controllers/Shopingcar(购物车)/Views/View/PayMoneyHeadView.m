//
//  PayMoneyHeadView.m
//  Dream+
//
//  Created by macbook on 2017/10/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PayMoneyHeadView.h"

@implementation PayMoneyHeadView


+(instancetype)payMoneyHeadTableViewWithOwnNib{
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"PayMoneyHeadView" owner:nil options:nil];
    return nibs.firstObject;
}
@end
