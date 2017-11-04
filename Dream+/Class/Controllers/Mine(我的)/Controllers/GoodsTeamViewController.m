//
//  GoodsTeamViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "GoodsTeamViewController.h"
#import "GoodsTeamTableViewCell.h"
@interface GoodsTeamViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalMoneyLabel;

@property (strong, nonatomic) NSMutableArray *dataSource;
@end


@implementation GoodsTeamViewController
- (IBAction)PayMoneyClick:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
}
- (void)setTableView
{
    _tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GoodsTeamTableViewCell" bundle:nil] forCellReuseIdentifier:@"GoodsTeamTableViewCell"];
    
}

#pragma mark - UITableView delegate



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return 5;
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
    
    return 100;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsTeamTableViewCell"];
    if (_dataSource.count > indexPath.section)
    {
        
    }
    
    
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
