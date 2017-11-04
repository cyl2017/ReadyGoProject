//
//  PayHeadTableView.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PayHeadTableView.h"

@implementation PayHeadTableView

+(instancetype)payHeadTableViewWithOwnNib{
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"PayHeadTableView" owner:nil options:nil];
    return nibs.firstObject;
}


@end
