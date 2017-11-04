//
//  AddCardViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/28.
//  Copyright © 2017年 Apple. All rights reserved.
//
#import "AddNewCardViewController.h"
#import "AddCardViewController.h"
#import "BankCardTableViewCell.h"
#import "AddCardFootView.h"
#define rowHeight 100
@interface AddCardViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, weak) UITableView * tableView;//list
@property (strong, nonatomic) NSArray *dataSource;
@property (strong, nonatomic) AddCardFootView *footView;

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = @[
                    @{@"title":@"中国建设银行",@"text":@"621722227778900",@"image":@"1"},
                    @{@"title":@"中国建设银行",@"text":@"621722227778900",@"image":@"1"},
                    @{@"title":@"中国建设银行",@"text":@"621722227778900",@"image":@"1"},
                    ];
    [self setTableView];
}

- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(10,0, kScreenWidth-20, kScreenHeight ) style:UITableViewStylePlain];
    tableView.bounces = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.scrollEnabled = YES;
     tableView.backgroundColor = BMColor(244, 245, 246);
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BankCardTableViewCell" bundle:nil] forCellReuseIdentifier:@"BankCardTableViewCell"];

    self.footView =[AddCardFootView addCardViewWithOwnNib];
    self.tableView.tableFooterView = self.footView;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addTap:)];
    tap.delegate = self;
    [self.footView addGestureRecognizer:tap];
    
}
- (void)addTap:(UITapGestureRecognizer *)gesture {
    
    AddNewCardViewController*  infoVC=[[AddNewCardViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
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
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return rowHeight;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BankCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BankCardTableViewCell"];
       if (_dataSource.count > indexPath.section)
    {
        NSDictionary *dic = _dataSource[indexPath.section];
        cell.bankTitle.text = dic[@"title"];
        
        cell.cardText.text = dic[@"text"];
        
        cell.photo.image = [UIImage imageNamed:@"店铺"];
        [cell.deleteBtn addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
  
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
}
-(void)delete:(UIButton *)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
