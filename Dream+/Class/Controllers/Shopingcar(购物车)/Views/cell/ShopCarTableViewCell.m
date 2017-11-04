//
//  ShopCarTableViewCell.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShopCarTableViewCell.h"
#import "ShopingCarVC.h"

@implementation ShopCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _calculatorView.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)selectBtnClick:(id)sender {
    _selectBtn.hidden = !_selectBtn.hidden;
    ShopingCarVC *vc = (ShopingCarVC *)[LKMainTool viewController:self];
    [vc.tableView reloadData];
  
}
@end
