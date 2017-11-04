//
//  CategoryVC.m
//  WenDao
//
//  Created by liuke on 2017/3/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CategoryVC.h"
#import "HomeProductCell.h"
#import "ProductCategoryCell.h"
#import "ProductCategoryHeader.h"
#import "CategoryModel.h"
#import "SecondCategoryModel.h"
#import "ProductDetailVC.h"
@interface CategoryVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    CGFloat itenWidth;
    }
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *categorySource;
@end

@implementation CategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _categorySource = @[].mutableCopy;
    [self setDatasource];
    [self createTableView];
    [self createCollctionView];
       // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
}


-(void)setDatasource{
    for (int i=0; i<5; i++) {
        CategoryModel *model = [CategoryModel new];
        if (i==0) {
            model.isSelected = YES;
        }else{
            model.isSelected = NO;
        }
        
        [_categorySource addObject:model];
    }



}


-(void)createTableView{
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, kScreenHeight-44) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"ProductCategoryCell" bundle:nil] forCellReuseIdentifier:@"ProductCategoryCell"];
    
}



#pragma mark --- 创建CollectuionView
-(void)createCollctionView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(100,0,kScreenWidth-100, kScreenHeight-64-49 ) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //默认颜色黑色
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.tag = 100;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeProductCell" bundle:nil] forCellWithReuseIdentifier:@"HomeProductCell"];
    //注册标题头
    [self.collectionView registerNib:[UINib nibWithNibName:@"ManufactureHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ManufactureHeader"];
    
}


#pragma  mark ----------------delegate------

#pragma mark - tableViewDelegate  && tableViewDataSiurce

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //折叠操作
    CategoryModel *model;
    model = _categorySource[section];
    if (model.isSelected) {
        return 5;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCategoryCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"ProductCategoryCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    if (cell.selected) {
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.categoryName.textColor =BMColor(253, 114, 30);
    }else {
        cell.backgroundColor =[UIColor whiteColor];
        cell.categoryName.textColor =[UIColor lightGrayColor];
    }
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ProductCategoryHeader *headerView = [[[NSBundle mainBundle]loadNibNamed:@"ProductCategoryHeader" owner:self options:nil]lastObject];
    CategoryModel *model;
    
    if (_categorySource.count>0) {
        model = _categorySource[section];
    }
    if (model.isSelected) {
        headerView.imgBtn.layer.borderWidth = 1.0f;
        headerView.imgBtn.layer.borderColor =BMColor(251, 0, 27).CGColor;
        headerView.categoryName.textColor = BMColor(251, 0, 27);
    }else{
        headerView.imgBtn.layer.borderWidth = 1.0f;
        headerView.imgBtn.layer.borderColor =BMColor(231, 231, 231).CGColor;
        headerView.categoryName.textColor = [UIColor blackColor];
        
    }
    
    headerView.model =model;
    [[headerView.imgBtn rac_signalForControlEvents:UIControlEventTouchUpInside ]subscribeNext:^(id x) {
        
        CategoryModel *model = _categorySource[section];
        model.isSelected =!model.isSelected;
        [self.tableView reloadSection:section withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中操作
    
    [self selectedClassWithInteger:indexPath];
    
}


#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
//设置段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


//设置单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeProductCell" forIndexPath:indexPath];
   
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((kScreenWidth-130)/2, 1.35*(kScreenWidth-130)/2);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //
    ProductDetailVC *pdvc = [ProductDetailVC new];
    pdvc.title = @"商品详情";
    [self.navigationController pushViewController:pdvc animated:YES];
    
   
}




/**
 *  选中左边菜单栏时响应的事件
 */
- (void)selectedClassWithInteger:(NSIndexPath *)indexPath
{
   
    [self.tableView reloadData];
}


@end
