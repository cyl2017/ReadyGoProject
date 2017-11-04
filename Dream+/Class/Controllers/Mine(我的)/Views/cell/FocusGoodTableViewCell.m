//
//  FocusGoodTableViewCell.m
//  Dream+
//
//  Created by macbook on 2017/10/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "FocusGoodTableViewCell.h"

@implementation FocusGoodTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _cancelButton.layer.cornerRadius = 5;
    _cancelButton.layer.borderColor = [UIColor orangeColor].CGColor;
    _cancelButton.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
