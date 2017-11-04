//
//  OrderTableViewCell.m
//  Dream+
//
//  Created by macbook on 2017/10/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _payBtn.layer.cornerRadius = 5;
    _cancelBtn.layer.cornerRadius = 5;
    _cancelBtn.layer.borderWidth = 1;

    _cancelBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
}
- (IBAction)payClick:(id)sender {
}
- (IBAction)cancel:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
