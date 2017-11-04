//
//  AddressViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressTableViewCell.h"
#import "NewAddressViewController.h"
@interface AddressViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation AddressViewController
- (IBAction)addNewaddress:(id)sender {
    NewAddressViewController *  infoVC=[[NewAddressViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
}
- (void)setTableView
{
    _tableView.tableFooterView = [[UIView alloc] init];
   
    [self.tableView registerNib:[UINib nibWithNibName:@"AddressTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddressTableViewCell"];
    
}

#pragma mark - UITableView delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
    
    return _dataSource.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 130;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressTableViewCell"];
    if (_dataSource.count > indexPath.row)
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
