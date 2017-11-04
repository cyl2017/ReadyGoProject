//
//  VipViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VipViewController.h"
#import "GoodsTeamViewController.h"
#import "TeamCenterViewController.h"
@interface VipViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *vipScrollView;

@end

@implementation VipViewController
- (IBAction)goodsTeamClick:(id)sender {
    GoodsTeamViewController *  infoVC=[[GoodsTeamViewController alloc]init];
      [self.navigationController pushViewController:infoVC animated:YES];
}
- (IBAction)teamCenterClick:(id)sender {
    TeamCenterViewController *infoVC = [[TeamCenterViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _vipScrollView.contentSize=CGSizeMake(kScreenWidth, kScreenHeight-64);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
