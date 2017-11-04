//
//  HomeProductCell.m
//  Dream+
//
//  Created by liuke on 2017/10/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HomeProductCell.h"

@implementation HomeProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.borderWidth = 0.5f;
    self.contentView.layer.borderColor = BMColor(231, 231, 231).CGColor;
    // Initialization code
}

@end
