//
//  AccountSafeViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AccountSafeViewController.h"
#import "ForgetPassWord.h"
#import "CertificationVC.h"
@interface AccountSafeViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;//list
@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation AccountSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataSource = @[
                    @{@"title":@"手机认证",@"text":@"1888888888",@"image":@"1"},
                    @{@"title":@"实名认证",@"text":@"",@"image":@"0"},
                    @{@"title":@"登录密码",@"text":@"",@"image":@"1"},
                   ];
    [self setTableView];
}
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight ) style:UITableViewStylePlain];
    tableView.bounces = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.scrollEnabled = NO;
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    if (_dataSource.count > indexPath.row)
    {
         NSDictionary *dic = _dataSource[indexPath.row];
        cell.textLabel.text = dic[@"title"];
        cell.textLabel.font = FONT(15);
        cell.detailTextLabel.text = dic[@"text"];

        UIImage *image1 = [UIImage imageNamed:@"yirenzheng"];
        UIImage *image2 = [UIImage imageNamed:@"weirenzheng"];
        
        cell.imageView.image = [dic[@"image"] integerValue]==1? image1:image2;
        
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case 0:
        {}
            break;
        case 1:{
            
            CertificationVC *cerVC = [CertificationVC new];
            [self.navigationController pushViewController:cerVC animated:YES];
           }
            break;
        case 2:{
            ForgetPassWord *forgetPassVC = [ForgetPassWord new];
            forgetPassVC.navigationItem.title = @"修改密码";
            [self.navigationController pushViewController:forgetPassVC animated:YES];
        }
            
            break;
            
        default:
            break;
    }
    
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
