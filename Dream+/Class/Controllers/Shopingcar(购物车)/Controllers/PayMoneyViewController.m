//
//  PayMoneyViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//
#import "PayHeadTableView.h"
#import "PayMoneyViewController.h"
#import "PayMoneyHeadView.h"
#import "PayTableViewCell.h"
#import "PayMoneyFootView.h"
#import "MerChantVC.h"
@interface PayMoneyViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation PayMoneyViewController
- (IBAction)cancel:(id)sender {
}
- (IBAction)pay:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = @[
    [NSNull null],
    @[ @{@"title":@"订单编号：",@"text":@"201736738582399"},
                                     @{@"title":@"下单时间",@"text":@"2017/10/02 09:33:50"},
                                     @{@"title":@"支付方式",@"text":@"2017/10/02 09:33:50"},
                                     @{@"title":@"是否配送",@"text":@"2017/10/02 09:33:50"}],
  @[@{@"title":@"优惠活动",@"text":@"0.00元"}]];
     [self setTableView];
}
- (void)setTableView
{
    PayMoneyHeadView *head = [PayMoneyHeadView payMoneyHeadTableViewWithOwnNib];
   
    self.tableView.tableHeaderView =head;
    PayMoneyFootView *foot =  [PayMoneyFootView PayMoneyFootViewWithOwnNib];   
    self.tableView.tableFooterView =foot;
    [self.tableView registerNib:[UINib nibWithNibName:@"PayTableViewCell" bundle:nil] forCellReuseIdentifier:@"PayTableViewCell"];
    
}
#pragma mark - UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
    
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1) {
        return 4;

    }
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 80;
        
    }
    return 44;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
    return 40;
    }
    return 0;

}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        PayHeadTableView *head = [PayHeadTableView payHeadTableViewWithOwnNib];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToShopTap:)];
        tap.delegate = self;
        [head addGestureRecognizer:tap];
        return head;
    }
    return nil;
}
- (void)goToShopTap:(UITapGestureRecognizer *)gesture {
    
    PayHeadTableView *view =  (PayHeadTableView*) gesture.view ;
    //进入商家 1
    
    MerChantVC *merchantVC = [MerChantVC new];
    merchantVC.title = view.shopNameLabel.text;
    [self.navigationController pushViewController:merchantVC animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell ;
    if (indexPath.section==0)
    {
       PayTableViewCell *  cell1=[tableView dequeueReusableCellWithIdentifier:@"PayTableViewCell"];
        cell1.count.textColor = [UIColor redColor];
        cell1.price.textColor = [UIColor lightGrayColor];
        cell=cell1;
    }else if(_dataSource.count>indexPath.section){
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell==nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
            cell.textLabel.font = Kfont(15);
            cell.detailTextLabel.font = Kfont(15);
            cell.textLabel.textColor = [UIColor lightGrayColor];
            cell.detailTextLabel.textColor = [UIColor blackColor];
            NSDictionary *dic =_dataSource[indexPath.section][indexPath.row];
            cell.textLabel.text = dic[@"title"];
            cell.detailTextLabel.text = dic[@"text"];
        }

    }
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
     [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
