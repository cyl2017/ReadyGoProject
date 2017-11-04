//
//  CategoryProductListVC.m
//  Dream+
//
//  Created by liuke on 2017/10/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CategoryProductListVC.h"
#import "ProductDetailVC.h"
#import "MerChantProductListCell.h"
@interface CategoryProductListVC ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CategoryProductListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MerChantProductListCell" bundle:nil] forCellReuseIdentifier:@"MerChantProductListCell"];
    // Do any additional setup after loading the view from its nib.
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
