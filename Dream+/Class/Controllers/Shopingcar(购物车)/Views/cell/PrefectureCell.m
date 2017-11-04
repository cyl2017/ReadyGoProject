//
//  PrefectureCell.m
//  WenDao
//
//  Created by 黄斌 on 2017/4/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PrefectureCell.h"

@implementation PrefectureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectButton.layer.masksToBounds = YES;
    self.selectButton.layer.cornerRadius = 15;
}

- (void)onSelect:(BOOL)isSelect
{
    if (isSelect) {
        
    } else {
        
    }
}

@end
