//
//  FootprintViewController.m
//  WenDao
//
//  Created by 黄斌 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "FootprintVC.h"
#import "PrefectureCell.h"
#import "ProductDetailVC.h"
#import "HttpClient+Prefecture.h"
#import "FootprintModel.h"
#import "MBProgressHUD+MJ.h"
#import "SynthesizeVC.h"
@interface FootprintVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) NSMutableArray *dataList;

@property (nonatomic,strong) NSMutableArray *recordSelectList;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (assign, nonatomic) BOOL isDelete;

@end

@implementation FootprintVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的足迹";
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"PrefectureCell" bundle:nil] forCellWithReuseIdentifier:@"PrefectureCell"];
    
    _dataList = @[].mutableCopy;
    _recordSelectList = @[].mutableCopy;
    
     [self requestMyTracks];
}


//获取我的足迹
- (void)requestMyTracks {
    
    UserModel *model = [ToolClass userInfo];
    [HttpClient getMyTracks:@{@"memberId":model.id} CompleteleHandek:^(NSDictionary *data, NSError *error)
    {
        if (!error)
        {
            [_dataList removeAllObjects];
            [_recordSelectList removeAllObjects];
            
            NSArray *arrays = [FootprintModel mj_objectArrayWithKeyValuesArray:data[@"object"]];
            for (FootprintModel *model in arrays)
            {
                [_recordSelectList addObject:@"0"];
                [_dataList addObject:model];
            }
            if (_dataList.count > 0) {
                self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(deleteOnClick)];
                NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:NSForegroundColorAttributeName];
                [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
            }
            
            [self.collectionView reloadData];
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
        [self.collectionView reloadData];
    } else {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(deleteOnClick)];
        NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:NSForegroundColorAttributeName];
        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
        NSString *ids = @"";
        BOOL isDelete = NO;
        
        for (NSInteger i=0; i<_dataList.count; ++i)
        {
            FootprintModel *model = _dataList[i];
            if ([_recordSelectList[i] isEqualToString:@"1"])
            {
                isDelete = YES;
                ids = [NSString stringWithFormat:@"%@,%@",ids,model.mytracksId];
            }
        }
        
        if (isDelete == NO) {
            self.isDelete = YES;
            [MBProgressHUD showError:@"请选择需要删除的记录"];
        } else {
            ids = [ids substringFromIndex:1];
            [HttpClient deleteMyTracks:@{@"ids":ids} CompleteleHandek:^(BMResponse *response, NSError *error) {
                if (!error) {
                    if (response.status == 0) {
                        [MBProgressHUD showSuccess:response.msg];
                        for (NSInteger i=0; i<_dataList.count; ++i)
                        {
                            if ([_recordSelectList[i] isEqualToString:@"1"])
                            {
                                [_dataList removeObjectAtIndex:i];
                                [_recordSelectList removeObjectAtIndex:i];
                                i = i-1;
                            }
                        }
                        [self.collectionView reloadData];
                    } else {
                        [MBProgressHUD showSuccess:response.msg];
                    }
                }
            }];
        }
    }
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
    CGFloat height = width * 1.35 / 1;
    return CGSizeMake(width, height);
}

//单元格
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PrefectureCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"PrefectureCell" forIndexPath:indexPath];
    
    FootprintModel *model = _dataList[indexPath.row];

    [cell.listImage sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    if (!isStringEmpty(model.price)) {
        cell.listPrice.text = [NSString stringWithFormat:@"¥%@",model.price];
    } else {
        cell.listPrice.text = @"";
    }
    
    if (!isStringEmpty(model.productName)) {
        cell.listTitle.text = [NSString stringWithFormat:@"%@",model.productName];
    } else {
        cell.listTitle.text = @"";
    }
    [cell.selectButton addTarget:self action:@selector(selectOnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectButton.tag = indexPath.row;
    
    if (_isDelete)
    {
        cell.selectButton.hidden = NO;
        if ([_recordSelectList[indexPath.row] isEqualToString:@"1"])
        {
            [cell.selectButton setBackgroundColor:[UIColor colorWithRed:63/255.0 green:191/255.0 blue:111/255.0 alpha:1.0]];
        }
        else
        {
            [cell.selectButton setBackgroundColor:[UIColor colorWithRed:231/255.0 green:231/255.0 blue:231/255.0 alpha:1.0]];
        }
    }
    else
    {
        cell.selectButton.hidden = YES;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FootprintModel *model = _dataList[indexPath.row];
    if ([model.type integerValue]==83 ||[model.type integerValue] ==84) {
        
        SynthesizeVC *detailVC = [initStoryBord instantiateViewControllerWithIdentifier:@"SynthesizeVC"];
        detailVC.productId = model.id;
        detailVC.type = model.type;
        [self.navigationController pushViewController:detailVC animated:YES];
    }else{
        ProductDetailVC *detailVC = [initStoryBord instantiateViewControllerWithIdentifier:@"ProductDetailVC"];
        detailVC.productId = model.id;
        [self.navigationController pushViewController:detailVC animated:YES];
    }

}

- (void)selectOnClick:(UIButton *)button
{
    if ([_recordSelectList[button.tag] isEqualToString: @"1"])
        _recordSelectList[button.tag] = @"0";
    else
        _recordSelectList[button.tag] = @"1";
    
    [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:button.tag inSection:0]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
