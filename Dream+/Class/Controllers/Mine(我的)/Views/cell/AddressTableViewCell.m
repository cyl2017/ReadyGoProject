//
//  AddressTableViewCell.m
//  Dream+
//
//  Created by macbook on 2017/10/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectedTap:)];
    tap.delegate = self;
    [_tapView addGestureRecognizer:tap];
}
- (void)selectedTap:(UITapGestureRecognizer *)gesture {
   
}

- (IBAction)deleteClick:(id)sender {
}
- (IBAction)editClick:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
