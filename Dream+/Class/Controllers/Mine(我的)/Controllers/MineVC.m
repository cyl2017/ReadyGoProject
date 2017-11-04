//
//  MineVC.m
//  Dream+
//
//  Created by macbook on 2017/10/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MineVC.h"
#import "MineInfoViewController.h"
#import "VipViewController.h"
#import "BuyBackViewController.h"
#import "OrderStatusViewController.h"
#import "AddressViewController.h"
#import "MessageCenterViewController.h"
#import "HelpCenterViewController.h"
#import "AccountSafeViewController.h"
#import "MYFocusViewController.h"
#import "QRCodeViewController.h"
#import "ShopsCenterViewController.h"
#import "GiveCountViewController.h"
@interface MineVC ()
@property (weak, nonatomic) IBOutlet UIButton *vipBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;//背景图
@property (weak, nonatomic) IBOutlet UIImageView *imageHead;//圆形头像
@property (weak, nonatomic) IBOutlet UIButton *waitProduct;//代发货
@property (weak, nonatomic) IBOutlet UIButton *finishAfter;//退换货
@property (weak, nonatomic) IBOutlet UIButton *waitComment;//待收货
@property (weak, nonatomic) IBOutlet UIButton *waitMoney;//代付款
@property (weak, nonatomic) IBOutlet UIButton *backBuyBtn;
@end

@implementation MineVC
//会员中心
- (IBAction)vipClick:(id)sender {
    
    VipViewController*infoVC=[[VipViewController alloc]init];
    infoVC.navigationItem.title = @"会员中心";
    [self.navigationController pushViewController:infoVC animated:YES];
}
//回购积分
- (IBAction)repayCountClick:(id)sender {
    BuyBackViewController*infoVC=[[BuyBackViewController alloc]init];
    infoVC.navigationItem.title = @"积分兑换";
    [self.navigationController pushViewController:infoVC animated:YES];
}
//所有订单
- (IBAction)seeAllOrderClick:(id)sender {
    OrderStatusViewController*infoVC=[[OrderStatusViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
}
//个人中心
- (IBAction)changeMineInfoTap:(id)sender {
    MineInfoViewController*infoVC=[[MineInfoViewController alloc]init];
    infoVC.title = @"个人中心";
    [self.navigationController pushViewController:infoVC animated:YES];
}
//积分赠送
- (IBAction)integralGiftTap:(id)sender {
    GiveCountViewController*infoVC=[[GiveCountViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
}
//tag21-24
- (IBAction)orderStatusClick:(id)sender {
    
    OrderStatusViewController*infoVC=[[OrderStatusViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
   }
//tag31-38
- (IBAction)funcButtonClick:(UIButton*)sender {
    UIViewController *infoVC;
    switch (sender.tag-30) {
        case 1:
            infoVC=[[VipViewController alloc]init];
            infoVC.navigationItem.title = @"会员中心";
           break;
        case 2:
             infoVC=[[AddressViewController alloc]init];
            infoVC.navigationItem.title = @"地址管理";
            break;
        case 3:
            infoVC=[[MessageCenterViewController alloc]init];
            infoVC.navigationItem.title = @"消息中心";
            break;
        case 4:
            infoVC=[[ShopsCenterViewController alloc]init];
         
            break;
        case 5:
            infoVC=[[MYFocusViewController alloc]init];
            infoVC.navigationItem.title = @"我的关注";
            break;
        case 6:
             infoVC=[[QRCodeViewController alloc]init];
            infoVC.navigationItem.title = @"推荐二维码";
            break;
        case 7:
            infoVC=[[AccountSafeViewController alloc]init];
            infoVC.navigationItem.title = @"账户安全";
            break;
        case 8:
            infoVC=[[HelpCenterViewController alloc]init];
            infoVC.navigationItem.title = @"帮助中心";
            break;
       
        default:
            break;
    }
    [self.navigationController pushViewController:infoVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _headImage.image = [UIImage imageNamed:@"1"];
    
    _imageHead.layer.cornerRadius = _imageHead.width/2;
    _imageHead.clipsToBounds = YES;
    _backBuyBtn.layer.cornerRadius = 5;
    _backBuyBtn.layer.borderWidth = 1;
    
    _backBuyBtn.layer.borderColor = [UIColor redColor].CGColor;
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
