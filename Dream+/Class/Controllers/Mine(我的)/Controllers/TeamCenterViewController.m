//
//  TeamCenterViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TeamCenterViewController.h"

@interface TeamCenterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation TeamCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"团队中心";
    _dataSource = @[
                    @{@"title":@"1888888888",@"time":@"218",@"price":@"5000"},
                    @{@"title":@"1888888888",@"time":@"201",@"price":@"1000"},
                    @{@"title":@"1778888888",@"time":@"178",@"price":@"10000"},
                    @{@"title":@"1888888888",@"time":@"78",@"price":@"3000"},
                    @{@"title":@"1888888888",@"time":@"0",@"price":@"1000"},
                    @{@"title":@"1778888888",@"time":@"13",@"price":@"10000"},
                    @{@"title":@"1888888888",@"time":@"13",@"price":@"3000"},
                    @{@"title":@"1888888888",@"time":@"13",@"price":@"1000"},
                    @{@"title":@"1778888888",@"time":@"13",@"price":@"10000"},
                    @{@"title":@"1888888888",@"time":@"13",@"price":@"3000"},
                    @{@"title":@"1888888888",@"time":@"13",@"price":@"1000"},
                    @{@"title":@"1778888888",@"time":@"13",@"price":@"10000"},
                    @{@"title":@"1888888888",@"time":@"13",@"price":@"3000"},
                    @{@"title":@"1888888888",@"time":@"13",@"price":@"1000"},
                    @{@"title":@"1778888888",@"time":@"13",@"price":@"10000"},
                    @{@"title":@"1888888888",@"time":@"13",@"price":@"3000"}];
}
#pragma mark - UITableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
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
    if (_dataSource.count > indexPath.section)
    {
        NSDictionary *dic = _dataSource[indexPath.section];
        cell.textLabel.text = dic[@"title"];
        cell.textLabel.font = FONT(15);
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@人",dic[@"time"]];
        cell.detailTextLabel.textColor =[UIColor lightGrayColor];
        cell.imageView.image = [UIImage imageNamed:@"方形"];
        
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
    }return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
