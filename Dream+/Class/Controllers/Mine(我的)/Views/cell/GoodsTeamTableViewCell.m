//
//  GoodsTeamTableViewCell.m
//  Dream+
//
//  Created by macbook on 2017/10/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "GoodsTeamTableViewCell.h"

@implementation GoodsTeamTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)selectBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
}

//tag:-10;+11
- (IBAction)MPButtonClick:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
