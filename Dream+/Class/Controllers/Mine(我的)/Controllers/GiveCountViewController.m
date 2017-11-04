//
//  GiveCountViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
// 赠送积分

#import "GiveCountViewController.h"

@interface GiveCountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;//list
@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation GiveCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"积分赠送";
    _dataSource = @[
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"5000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"积分返利（商家）",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"积分返利（商家）",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"消费积分返利（商家）",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"消费积分返利",@"time":@"2017/10/02 09:33:50",@"price":@"3000"}];
    [self setTableView];

}
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight ) style:UITableViewStylePlain];
    tableView.bounces = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.scrollEnabled = YES;
    tableView.tableFooterView = [[UIView alloc]init];
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
        cell.textLabel.font = Kfont(13);
        cell.textLabel.textColor = [UIColor lightGrayColor];
        cell.detailTextLabel.text = dic[@"time"];
        cell.detailTextLabel.textColor =[UIColor lightGrayColor];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 140, 30)];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor redColor];
        label.font = Kfont(13);

        label.text = [NSString stringWithFormat:@"%.2f积分", [dic[@"price"] floatValue]];
        cell.accessoryView  = label;
        
    }
   [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    cell.userInteractionEnabled = NO;
    return cell;
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
