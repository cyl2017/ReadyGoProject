//
//  HomeVC.m
//  WenDao
//
//  Created by liuke on 2017/3/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HomeVC.h"
#import "HomeHeaderReusableView.h"
#import "HomeProductCell.h"
#import "ProductDetailVC.h"
#import "AllProductVC.h"
#import "LKBaseViewController.h"
#import "CategoryProductListVC.h"
#import "HttpClient+HomeRequest.h"
#import "LoginVC.h"
#import "AdvertiseModel.h"
@interface HomeVC ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SDCycleScrollViewDelegate>{
    
}

//
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)HomeHeaderReusableView *headerView;
@property (nonnull,strong) NSMutableArray *advSource;
@property (nonnull,strong) NSMutableArray *urlArray;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.advSource = @[].mutableCopy;
    self.urlArray = @[].mutableCopy;
    [self getHomeAdSource];
    [self createCollctionView];
        // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  
}


#pragma mark --- 广告接口

-(void)getHomeAdSource{
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    params[@"pageNO"] = @"1";
    params[@"pageSize"] = @"20";
    [[HttpClient sharedInstance]findBannerListParams:params CompleteleHandek:^(NSDictionary *data, NSError *error) {
        if (data) {
            _advSource = [AdvertiseModel mj_objectArrayWithKeyValuesArray:data[@"list"]];
            [_advSource enumerateObjectsUsingBlock:^(AdvertiseModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
                if (model.img.length>0) {
                  [_urlArray addObject:model.img];
                }
               
            }];
            self.headerView.adScrollerView.imageURLStringsGroup = _urlArray;
        }
        
    }];
    
}

#pragma mark --- 创建CollectuionView
-(void)createCollctionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth, kScreenHeight-44 ) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    //默认颜色黑色
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.tag = 100;
    [self.view addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeProductCell" bundle:nil] forCellWithReuseIdentifier:@"HomeProductCell"];
    //注册标题头
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeHeaderReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeHeaderReusableView"];
   
    
    
    
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
    
    return CGSizeMake((kScreenWidth-30)/2, 1.35*(kScreenWidth-30)/2);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//设置竖直间隙  ： 默认10
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//设置边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}
//点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //
    
    ProductDetailVC *pdvc = [ProductDetailVC new];
    pdvc.title = @"商品详情";
    [self.navigationController pushViewController:pdvc animated:YES];
    
    
}
//设置标题头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
  
        
        return CGSizeMake(kScreenWidth, 135+kScreen_Width*0.5+140);
    
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
 
        if (!self.headerView) {
            self.headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HomeHeaderReusableView" forIndexPath:indexPath];
            self.headerView.adScrollerView.delegate = self;
            
            [[[self.headerView.allProduct rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:self.headerView.rac_prepareForReuseSignal] subscribeNext:^(id x) {
                //进入全部商品
                AllProductVC *allProductVC = [AllProductVC new];
                [self.navigationController pushViewController:allProductVC animated:YES];
               
           }];
            
            [[[self.headerView.nProduct rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:self.headerView.rac_prepareForReuseSignal] subscribeNext:^(id x) {
                //新品
                CategoryProductListVC *allProductVC = [CategoryProductListVC new];
                allProductVC.title = @"新品";
                [self.navigationController pushViewController:allProductVC animated:YES];
                
            }];
            
            
            [[[self.headerView.recommentPro rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:self.headerView.rac_prepareForReuseSignal] subscribeNext:^(id x) {
                //热门推荐
              /*  CategoryProductListVC *allProductVC = [CategoryProductListVC new];
                allProductVC.title = @"热门搜索";
                [self.navigationController pushViewController:allProductVC animated:YES];*/
                
                LoginVC *login  = [LoginVC new];
                LKBaseNavController *nav=[[LKBaseNavController alloc]initWithRootViewController:login];
                [self presentViewController:nav animated:YES completion:^{
                    
                }];
                
                
            }];
            
            
            [[[self.headerView.creditsExcahnge rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:self.headerView.rac_prepareForReuseSignal] subscribeNext:^(id x) {
                //积分兑换
                CategoryProductListVC *allProductVC = [CategoryProductListVC new];
                allProductVC.title = @"积分兑换";
                [self.navigationController pushViewController:allProductVC animated:YES];
                
            }];
            
        }
        return self.headerView;
    

}


@end
