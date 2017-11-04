//
//  MerChantVC.m
//  Dream+
//
//  Created by liuke on 2017/10/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MerChantVC.h"
#import "MerChantProductListCell.h"
#import "MerChantHeader.h"
#import "ProductDetailVC.h"
@interface MerChantVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation MerChantVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    // Do any additional setup after loading the view.
}


#pragma  mark ----- initTableViwe

-(void)initTableView{
   
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MerChantProductListCell" bundle:nil] forCellReuseIdentifier:@"MerChantProductListCell"];
    self.tableView.tableHeaderView = [[NSBundle mainBundle] loadNibNamed:@"MerChantHeader" owner:self options:nil].firstObject;
    
    
}



#pragma  mark ---  Delegate Or DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MerChantProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerChantProductListCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductDetailVC *pdvc = [ProductDetailVC new];
    pdvc.title = @"商品详情";
    [self.navigationController pushViewController:pdvc animated:YES];
    
}




@end
