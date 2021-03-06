//
//  MYFocusViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/25.
//  Copyright © 2017年 Apple. All rights reserved.
//
#import "ProductDetailVC.h"
#import "MerChantVC.h"
#import "CollectionModel.h"
#import "MYFocusViewController.h"
#import "FocusGoodTableViewCell.h"
#import "HttpClient+MineRequest.h"
@interface MYFocusViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnArr;//关注的商家和商品按钮
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineLeftLayout;
@property (weak, nonatomic) IBOutlet UIView *emptyView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (nonatomic,strong )UIButton *selectedBtn;//选中btn
@end

@implementation MYFocusViewController
{
    BOOL isRequest;
    NSInteger PageNum; // 页索引
    NSInteger PageSize; // 单面显示条数
}

//tag：0商品、1商家
- (IBAction)selectedButtonClick:(UIButton*)sender {
    self.redLineLeftLayout.constant = (kScreen_Width/2)*sender.tag;
    _selectedBtn = sender;
    for (UIButton *btn in _btnArr) {
        if (_selectedBtn.tag ==btn.tag) {
            btn.selected = YES;
        }else{
            btn.selected = NO;
        }
    }
    
    
}
//找店铺
- (IBAction)goShop:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emptyView.hidden = YES;
    self.navigationController.title = @"我的关注";
    [self setTableView];
}
- (void)setTableView
{
    _tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(doLoadMore)];
    //    [self.tableView.mj_header beginRefreshing];
    [self.tableView registerNib:[UINib nibWithNibName:@"FocusGoodTableViewCell" bundle:nil] forCellReuseIdentifier:@"FocusGoodTableViewCell"];
    
}
- (void)loadNewData
{    if (isRequest) {
        return;
    }
    isRequest = YES;
    PageNum = 1;
    _tableView.mj_footer.state = MJRefreshStateIdle;
    [_dataSource removeAllObjects];
    [self requestData];
}
-(void)doLoadMore
{
    if (isRequest) {
        return;
    }
    isRequest = YES;
    PageNum++;
    [self requestData];
}
#pragma mark --- 收藏列表接口
- (void)requestData
{
        NSMutableDictionary *params =[NSMutableDictionary dictionary];
        params[@"memberId"] = [ToolClass userInfo ].memberId;//会员ID
        params[@"type"] = @(_selectedBtn.tag);//类型(0商品，1商户)||tag：0商品、1商家
        [[HttpClient sharedInstance]findCollectionListParams:params CompleteleHandek:^(NSDictionary *data, NSError *error) {
            if (data) {
                _dataSource = [CollectionModel mj_objectArrayWithKeyValuesArray:data[@"list"]];
                [_tableView reloadData];
            }
            
        }];

    
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
    FocusGoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FocusGoodTableViewCell"];
    if (_dataSource.count > indexPath.row)
    {
        CollectionModel *model =_dataSource[indexPath.row] ;
        cell.focusTitle.text = model.commodityName;
        cell.price.text = model.commodityPrice;
        if (_selectedBtn.tag==1) {//|tag：0商品、1商家
            [cell.goodImage sd_setImageWithURL:[NSURL URLWithString:model.merchantImageUrl] placeholderImage:[UIImage imageNamed:@""]] ;
        }else{
            [cell.goodImage sd_setImageWithURL:[NSURL URLWithString:model.commodityImageUrl] placeholderImage:[UIImage imageNamed:@""]] ;
        }
        cell.cancelButton.tag = indexPath.row;
        [cell.cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    }

    return cell;
}
-(void)cancelButtonClicked:(UIButton *)sender{
    CollectionModel *model =_dataSource[sender.tag] ;
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    params[@"memberId"] = [ToolClass userInfo ].memberId;//会员ID
    params[@"collectionId"] = model.collectionId;//
    [[HttpClient sharedInstance]deleteCollectionParams:params CompleteleHandek:^(NSDictionary *data, NSError *error) {
        if (!error) {
         [BMToast makeText:@"删除成功"];
            [_tableView reloadData];
        }
        
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
     CollectionModel *model =_dataSource[indexPath.row] ;
    if (_selectedBtn.tag==0) {//|tag：0商品、1商家
        ProductDetailVC *pdvc = [ProductDetailVC new];
        // commodityId商品ID
        
        pdvc.title = @"商品详情";
        [self.navigationController pushViewController:pdvc animated:YES];

    }else if(_selectedBtn.tag==1){
        MerChantVC *pdvc = [MerChantVC new];
        //merchantId商户ID
    
        [self.navigationController pushViewController:pdvc animated:YES];
    }


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
