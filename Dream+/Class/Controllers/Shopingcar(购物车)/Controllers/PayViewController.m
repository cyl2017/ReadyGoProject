//
//  PayViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//
#import "PayMoneyViewController.h"
#import "PayViewController.h"
#import "AddressViewController.h"
#import "ShopCarTableViewCell.h"
#import "PayHeadView.h"
#import "MerChantVC.h"
#import "PayTableViewCell.h"
#import "PayHeadTableView.h"
#import "ProductDetailVC.h"
@interface PayViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalMoneyLabel;

@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation PayViewController{
    UILabel *youhuiPrice;
}
- (IBAction)commitOrder:(id)sender {
    PayMoneyViewController*  infoVC=[[PayMoneyViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
   
}

- (void)setTableView
{
      //head
    PayHeadView *head = [PayHeadView payHeadViewWithOwnNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeAddressTap:)];
    tap.delegate = self;
    [head addGestureRecognizer:tap];
    self.tableView.tableHeaderView =head;
    
    //foot
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    foot.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 40)];
    label.text = @"优惠活动：";
    label.font = Kfont(15);
    [foot addSubview:label];
    youhuiPrice = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-100, 0, 100, 40)];
    youhuiPrice.backgroundColor = [UIColor whiteColor];
    youhuiPrice.font = Kfont(15);
    youhuiPrice.text = @"-0元";
    youhuiPrice.textColor = [UIColor redColor];
    [foot addSubview:youhuiPrice];
    self.tableView.tableFooterView =foot;
    
    //registerNib
    [self.tableView registerNib:[UINib nibWithNibName:@"PayTableViewCell" bundle:nil] forCellReuseIdentifier:@"PayTableViewCell"];
    
}
- (void)changeAddressTap:(UITapGestureRecognizer *)gesture {
    
    AddressViewController*  infoVC=[[AddressViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
}

#pragma mark - UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    PayHeadTableView *head = [PayHeadTableView payHeadTableViewWithOwnNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToShopTap:)];
    tap.delegate = self;
    [head addGestureRecognizer:tap];
    return head;
}
- (void)goToShopTap:(UITapGestureRecognizer *)gesture {
    
    PayHeadTableView *view =  (PayHeadTableView*) gesture.view ;
    //进入商家 1
    
    MerChantVC *merchantVC = [MerChantVC new];
    merchantVC.title = view.shopNameLabel.text;
    [self.navigationController pushViewController:merchantVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PayTableViewCell"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ProductDetailVC* infoVC=[[ProductDetailVC alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
