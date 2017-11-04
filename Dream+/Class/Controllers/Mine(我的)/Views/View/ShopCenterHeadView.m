//
//  ShopCenterHeadView.m
//  Dream+
//
//  Created by macbook on 2017/10/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShopCenterHeadView.h"
#import "TeamCenterViewController.h"

@implementation ShopCenterHeadView

+(instancetype)headViewWithOwnNib{
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ShopCenterHeadView" owner:nil options:nil];
    return nibs.firstObject;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    _teamCenterBtn.layer.cornerRadius = 5;
    _teamCenterBtn.layer.borderWidth = 1;
    
    _teamCenterBtn.layer.borderColor = [UIColor whiteColor].CGColor;

}

- (IBAction)teamCenterBtnClick:(id)sender {
    TeamCenterViewController *infoVC = [[TeamCenterViewController alloc]init];
    [[LKMainTool viewController:self].navigationController pushViewController:infoVC animated:YES];
}
@end
