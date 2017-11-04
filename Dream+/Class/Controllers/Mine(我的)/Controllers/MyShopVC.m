//
//  MyShopVC.m
//  WenDao
//
//  Created by 黄斌 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyShopVC.h"
#import "PrefectureCell.h"
#import "MyShopCell.h"
#import "AddGoodsVC.h"
#import "HttpClient+Prefecture.h"
#import "MyShopModel.h"
#import "MBProgressHUD+MJ.h"
#import "ProductDetailVC.h"

@interface MyShopVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *dataList;

@property (assign, nonatomic) BOOL isDelete;

@end

@implementation MyShopVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self request];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我的店铺";
    
   
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;

    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"MyShopCell" bundle:nil] forCellWithReuseIdentifier:@"MyShopCell"];
    
    _dataList = [NSMutableArray arrayWithCapacity:0];
    
   
}

- (void)request {
    
    UserModel *userInfo = [ToolClass userInfo];
    
    NSDictionary *dict = @{@"plantId":userInfo.plantId};
    
    [HttpClient myShop:dict CompleteleHandek:^(NSDictionary *data, NSError *error)
     {
        if (!error) {
            [_dataList removeAllObjects];
            NSArray *array = [MyShopModel mj_objectArrayWithKeyValuesArray:data[@"object"]];
            if (array.count > 0 && array)
            {
                for (MyShopModel *model in array)
                {
                    [_dataList addObject:model];
                }
            }
            
            if (_dataList.count == 0) {
                [MBProgressHUD showError:@"暂无商品"];
            } else {
                self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(deleteOnClick)];
                NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:NSForegroundColorAttributeName];
                [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
            }
            
            [_collectionView reloadData];
        }
    }];
}

- (void)deleteOnClick
{
    if (_dataList.count == 0) {
        
        [MBProgressHUD showError:@"暂无商品可以删除"];
        
        return;
    }
    
    self.isDelete = !self.isDelete;
    if (self.isDelete) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(deleteOnClick)];
        NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:NSForegroundColorAttributeName];
        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    } else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(deleteOnClick)];
        NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:NSForegroundColorAttributeName];
        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
        NSString *ids = @"";
        BOOL isDelete = NO;
        for (MyShopModel *model in _dataList)
        {
            if (model.isDelete)
            {
                ids = [NSString stringWithFormat:@"%@,%@",ids,model.id];
                isDelete = YES;
            }
        }
    
        if (isDelete == NO) {
             self.isDelete = YES;
            [MBProgressHUD showError:@"请选择需要删除的商品"];
        } else {
            ids = [ids substringFromIndex:1];
            [HttpClient deleteProduct:@{@"ids":ids} CompleteleHandek:^(BMResponse *response, NSError *error) {
                if (!error) {
                    if (response.status == 0) {
                        [MBProgressHUD showSuccess:response.msg];
                        [self request];
                    } else {
                        [MBProgressHUD showSuccess:response.msg];
                    }
                }
            }];
            
        }
        
    }
    [self.collectionView reloadData];
}

#pragma mark collectionView delegate
// item数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataList.count;
}

//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

//偏移
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

//item的Size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (kScreenWidth - 15 * 3) / 2;
    CGFloat height = width * 1.2 / 1 + 40;
    return CGSizeMake(width, height);
}

//单元格
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyShopCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"MyShopCell" forIndexPath:indexPath];
    [cell.editButton addTarget:self action:@selector(editButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.editButton.tag = indexPath.row;
    
    [cell.deleteButton addTarget:self action:@selector(deleteOnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleteButton.tag = indexPath.row;
    if (_dataList) {
        MyShopModel *model = _dataList[indexPath.row];
        [cell.imageview sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@""]];
        cell.shopName.text = model.productName;
        if (!_isDelete) {
            cell.selectButton.hidden = YES;
        } else {
            cell.selectButton.hidden = NO;
            [cell onSelect:model.isDelete];
        }
    }

    [cell.selectButton addTarget:self action:@selector(selectOnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectButton.tag = indexPath.row;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyShopModel *model = _dataList[indexPath.row];
    ProductDetailVC *detail = [initStoryBord instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
    detail.productId = model.id;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)selectOnClick:(UIButton *)button
{
    MyShopModel *model = _dataList[button.tag];
    model.isDelete = !model.isDelete;
    [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:button.tag inSection:0]]];
}

- (void)editButtonOnClick:(ShopButton *)button
{
    MyShopModel *model = _dataList[button.tag];
    AddGoodsVC *goods = [[AddGoodsVC alloc] init];
    goods.productId = model.id;
    [self.navigationController pushViewController:goods animated:YES];
}

- (void)deleteOnClick:(ShopButton *)button
{
    if (_dataList) {
        MyShopModel *model = _dataList[button.tag];
        [HttpClient deleteProduct:@{@"ids":model.id} CompleteleHandek:^(BMResponse *response, NSError *error) {
            if (!error) {
                if (response.status == 0) {
                    [_dataList removeObjectAtIndex:button.tag];
                    [_collectionView reloadData];
                }
                [MBProgressHUD showError:response.msg];
            }
            
        }];
    }
}

//添加商品
- (IBAction)addShopOnClick:(UIButton *)button
{
    AddGoodsVC *goods = [[AddGoodsVC alloc] init]; 
    [self.navigationController pushViewController:goods animated:YES];
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
