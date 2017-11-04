//
//  ShopingCarVC.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//
#import "PayViewController.h"
#import "ShopingCarVC.h"
#import "HomeVC.h"
#import "MerChantVC.h"
#import "ProductDetailVC.h"
#import "ShopCarTableViewCell.h"
#import "ShopCarTabelHeadView.h"
@interface ShopingCarVC ()

@property (weak, nonatomic) IBOutlet UIView *footView;
@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation ShopingCarVC
{
    NSInteger editSection;
    UIButton * selectEditBtn;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    editSection = -1;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ShopCarTableViewCell" bundle:nil] forCellReuseIdentifier:@"ShopCarTableViewCell"];
}
- (IBAction)goBuy:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
    self.tabBarController.selectedIndex = 0;
}
- (IBAction)goPay:(id)sender {
    PayViewController*  infoVC=[[PayViewController alloc]init];
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
    ShopCarTabelHeadView *view = [ShopCarTabelHeadView shopCarTabelHeadViewWithOwnNib];
    view.tag = 100+section;
    view.editBtn.tag =1000+section;
    if (selectEditBtn.tag==view.editBtn.tag) {
         view.editBtn.selected =  selectEditBtn.selected;
    }
    [view.editBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(shopTap:)];
    tap.delegate = self;
    [view addGestureRecognizer:tap];
    return view;
}
-(void)editBtnClick:(UIButton *)editBtn{
    editBtn.selected = !editBtn.selected ;
    selectEditBtn = editBtn;
    editSection = editBtn.tag-1000;
    [_tableView reloadData];
}
- (void)shopTap:(UITapGestureRecognizer *)gesture {
    ShopCarTabelHeadView *view =  (ShopCarTabelHeadView*) gesture.view ;
    //进入商家 1
    
    MerChantVC *merchantVC = [MerChantVC new];
    merchantVC.title = view.shopNameLabel.text;
    [self.navigationController pushViewController:merchantVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopCarTableViewCell"];
    
    if (selectEditBtn.tag -1000==indexPath.section&&selectEditBtn.selected)
    {
        cell.calculatorView.hidden = NO;
    }else{
         cell.calculatorView.hidden = YES;
    }
  
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ProductDetailVC *pdvc = [ProductDetailVC new];
    pdvc.title = @"商品详情";
    [self.navigationController pushViewController:pdvc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
