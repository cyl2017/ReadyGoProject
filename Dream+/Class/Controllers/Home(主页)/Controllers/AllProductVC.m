//
//  AllProductVC.m
//  Dream+
//
//  Created by liuke on 2017/10/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AllProductVC.h"
#import "MerChantProductListCell.h"
#import "ProductDetailVC.h"
#import "BMSearchBar.h"
@interface AllProductVC ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
  BMSearchBar *_SearchBar;//
  NSInteger *priceTag;

}
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *selectedBtns;

@property (nonatomic,strong)UIButton *selectedBtn;

@end

@implementation AllProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSearchBar];
    self.navigationItem.rightBarButtonItem = [self createItem:[[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] title:@"搜索" action:@selector(searchClick)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"MerChantProductListCell" bundle:nil] forCellReuseIdentifier:@"MerChantProductListCell"];
    
    // Do any additional setup after loading the view from its nib.
}


#pragma  mark -- initSearchBar

-(void)initSearchBar{
    _SearchBar=[[BMSearchBar alloc]init];
    _SearchBar.frame=CGRectMake(0, 4, kScreenWidth*0.7, 64-30);
    _SearchBar.clipsToBounds = YES;
    _SearchBar.delegate = self;
    _SearchBar.placeholder = @"请输入商品关键字";
    UIView *searchBarBgView = [[UIView alloc]init];
    searchBarBgView.frame=CGRectMake(0, 5, kScreenWidth*0.7, 64-30);
    [searchBarBgView addSubview:_SearchBar];
    self.navigationItem.titleView = searchBarBgView;
    self.navigationItem.titleView.frame = CGRectMake( (kScreenWidth*0.7)/2.0, 20, kScreenWidth*0.7, 64-30);

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

- (IBAction)sort:(UIButton *)sender {
    self.leftConstraint.constant = sender.width*sender.tag;
    // 0 全部 1 销量 2 价格 3 新品
    _selectedBtn = sender;
    if(sender.tag!=2){
        
        
        [_selectedBtns enumerateObjectsUsingBlock:^(UIButton  *sender, NSUInteger idx, BOOL * _Nonnull stop) {
            if (_selectedBtn==sender) {
                _selectedBtn.selected = YES;
            }else{
                sender.selected = NO;
                
            }
        }];
        

    }else{
        [_selectedBtns enumerateObjectsUsingBlock:^(UIButton  *sender, NSUInteger idx, BOOL * _Nonnull stop) {
            if (_selectedBtn==sender) {
                _selectedBtn.selected = YES;
            }else{
                sender.selected = NO;
                
            }
        }];
    }
}

#pragma mark --- UISearchBarDelegate
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar becomeFirstResponder];
    
    // 2.显示遮盖（蒙板）
    if (self.cover == nil) {
        self.cover = [BMCover coverWithTarget:self action:@selector(coverClick)];
    }
    self.cover.frame = CGRectMake(0,64, kScreenWidth, kScreenHeight);
    
    [kWindow addSubview:self.cover];
    
    [self.cover reset];
    [UIView animateWithDuration:0.25 animations:^{
        [self.cover dim];
    }];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self coverClick];
   // _productName = _SearchBar.text;
    
   // [self  getSeccondTypeProduct];
    
}

-(void)searchClick{
    
    if (_SearchBar.text.length==0) {
        return;
    }
    
    [self coverClick];
 
   // [self  getSeccondTypeProduct];
    
}

#pragma mark 监听点击遮盖
- (void)coverClick
{
    // 1.移除遮盖
    [UIView animateWithDuration:0.25 animations:^{
        [self.cover reset];
    } completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
    }];
    
    [_SearchBar resignFirstResponder];
}


@end
