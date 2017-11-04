//
//  PayHeadView.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PayHeadView.h"

@implementation PayHeadView
+(instancetype)payHeadViewWithOwnNib{
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"PayHeadView" owner:nil options:nil];
    return nibs.firstObject;
}


@end
