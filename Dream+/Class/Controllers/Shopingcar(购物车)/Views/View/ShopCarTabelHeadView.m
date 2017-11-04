//
//  ShopCarTabelHeadView.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShopCarTabelHeadView.h"
#import "ShopingCarVC.h"
@implementation ShopCarTabelHeadView

- (IBAction)editBtnClick:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(editBtnClick:)])
    {
        [_delegate editBtnClick:sender];
    }

}
+(instancetype)shopCarTabelHeadViewWithOwnNib{
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ShopCarTabelHeadView" owner:nil options:nil];
    return nibs.firstObject;
}
- (IBAction)selectBtnClick:(id)sender {
    _selectBtn.hidden = !_selectBtn.hidden;
    ShopingCarVC *vc = (ShopingCarVC *)[LKMainTool viewController:self];
    [vc.tableView reloadData];
}

@end
