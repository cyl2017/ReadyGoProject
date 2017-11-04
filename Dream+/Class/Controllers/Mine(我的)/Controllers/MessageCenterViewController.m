//
//  MessageCenterViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MessageCenterViewController.h"

@interface MessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;//list
@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation MessageCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = @[
  @{@"title":@"商城公告",@"text":@"点击查看商城更新通知",@"image":@"喇叭"},
  @{@"title":@"订单通知",@"text":@"点击查看订单更新通知",@"image":@"货车"},
  @{@"title":@"我的资产",@"text":@"点击查看资产变动通知",@"image":@"钱"},
  @{@"title":@"活动中心",@"text":@"点击查看最新活动通知",@"image":@"喇叭"}];
#warning image
     [self setTableView];
}
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight ) style:UITableViewStylePlain];
    tableView.bounces = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.scrollEnabled = NO;
    tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    
}
#pragma mark - UITableView delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    if (_dataSource.count > indexPath.row)
    {
        NSDictionary *dic = _dataSource[indexPath.row];
        cell.textLabel.text = dic[@"title"];
        cell.textLabel.font = FONT(15);
        cell.detailTextLabel.text = dic[@"text"];
        cell.detailTextLabel.textColor =[UIColor lightGrayColor];
        cell.imageView.image = [UIImage imageNamed:dic[@"image"]];
    }
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
