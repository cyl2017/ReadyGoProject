//
//  BuyBackViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BuyBackViewController.h"
#import "AddCardViewController.h"
@interface BuyBackViewController ()
@property (weak, nonatomic) IBOutlet UIButton *moneyRecordBtn;//提现记录
@property (weak, nonatomic) IBOutlet UIButton *sureMoneyBtn;//确认提现
@property (weak, nonatomic) IBOutlet UIButton *getBtn;

@end

@implementation BuyBackViewController
- (IBAction)addCardTap:(id)sender {
    
    AddCardViewController *  infoVC=[[AddCardViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
}
- (IBAction)sureMoneyClick:(id)sender {
}
- (IBAction)getBtnClick:(id)sender {
}
- (IBAction)moneyRecordClick:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _sureMoneyBtn.layer.cornerRadius = 20;
    _sureMoneyBtn.clipsToBounds = YES;
    _moneyRecordBtn.layer.cornerRadius = 15;
    _moneyRecordBtn.layer.borderWidth = 1;
    _moneyRecordBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _getBtn.layer.cornerRadius = 15;
    _getBtn.layer.borderWidth = 1;
    _getBtn.layer.borderColor = [UIColor redColor].CGColor;
    
    // Do any additional setup after loading the view from its nib.
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
