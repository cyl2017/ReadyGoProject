//
//  ShopsCenterViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShopsCenterViewController.h"
#import "ShopCenterHeadView.h"
@interface ShopsCenterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)ShopCenterHeadView* headerView;
@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation ShopsCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商家中心";
    self.headerView =[ShopCenterHeadView headViewWithOwnNib];
    self.tableView.tableHeaderView = self.headerView;
 
    
       _dataSource = @[
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"5000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"会员购买商品套餐获得",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"会员购买商品套餐获得",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"会员购买商品套餐获得",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"会员购买商品套餐获得",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"3000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"1000"},
                    @{@"title":@"会员购买商品套餐获得",@"time":@"2017/10/02 09:33:50",@"price":@"10000"},
                    @{@"title":@"会员卡收益",@"time":@"2017/10/02 09:33:50",@"price":@"3000"}];

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




- (UITableViewCell *
   )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
        cell.detailTextLabel.text = dic[@"time"];
        cell.detailTextLabel.textColor =[UIColor lightGrayColor];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"+%.2f", [dic[@"price"] floatValue]];
        cell.accessoryView  = label;
       
    }
    if(indexPath.row%2==1){
        cell.backgroundColor= [UIColor groupTableViewBackgroundColor];
    }else{
        cell.backgroundColor= [UIColor whiteColor];
    }
    cell.userInteractionEnabled = NO;
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
