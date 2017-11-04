//
//  MineMessageVC.m
//  WenDao
//
//  Created by 黄斌 on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MineMessageVC.h"
#import "MyMessageCell.h"
#import "MessageModel.h"
#import "HttpClient+Prefecture.h"
#import "MBProgressHUD+MJ.h"
#import "MessageDetailVC.h"

@interface MineMessageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataList;
@property (assign, nonatomic) NSInteger pageNo;
@property (assign, nonatomic) NSInteger pageSize;

@end

@implementation MineMessageVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if(_isCoustom==1){
    self.title = @"定制消息";
    }else{
        self.title = @"我的消息";}
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 100;//很重要保障滑动流畅性
    
    [_tableView registerNib:[UINib nibWithNibName:@"MyMessageCell" bundle:nil] forCellReuseIdentifier:@"MyMessageCell"];
    
    _pageNo = 1;
    _pageSize = 10;
    
    _dataList = @[].mutableCopy;
    
    [self request];
    
    [self refesh];
}

- (void)refesh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        _pageNo = 1;
        [self request];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        _pageNo += 1;
        [self request];
    }];
}


- (void)request {
    UserModel *userInfo = [ToolClass userInfo];
    NSDictionary *dict = @{
        @"memberId": userInfo.id,
        @"pageNo": @(_pageNo),
        @"pageSize": @(_pageSize)
    };
    NSString *path;
    if (_isCoustom==1) {
          path = @"setting/findCustomize";
    }else{
          path = @"setting/findMessageBoard";
    }
    [HttpClient postWithParam:dict withUrl:path block:^(NSDictionary *result, NSError *error) {
        [self.tableView.mj_footer endRefreshing];
        [self.tableView.mj_header endRefreshing];
        if (!error) {
            NSDictionary *object = [result objectForKey:@"object"];
            if ([object isKindOfClass:[NSDictionary class]] && object) {
                NSArray *list = object[@"list"];
                if (_pageNo == 1) {
                    [_dataList removeAllObjects];
                }
                if (list) {
                    _dataList = [MessageModel mj_objectArrayWithKeyValuesArray:list];
                }
                for (MessageModel *model in _dataList) {
                    if ([model.isRead isEqualToString:@"0"])
                    {
                        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"忽略未读" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemOnClick)];
                        NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forKey:NSForegroundColorAttributeName];
                        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:dic forState:UIControlStateNormal];
                        break;
                    }
                }
            }
            if (_dataList.count == 0) {
                [MBProgressHUD showError:@"暂无数据"];
            }
            [self.tableView reloadData];
        }
        
        if (_dataList.count > 0) {
            if (_dataList.count % _pageSize == 0) {
                _pageNo = _dataList.count / _pageSize;
            } else {
                _pageNo = _dataList.count / _pageSize + 1;
            }
        } else {
            _pageNo = 0;
        }
    }];
}

//忽略未读消息
- (void)rightItemOnClick
{
    UserModel *model = [ToolClass userInfo];
    NSString *path;
    if (_isCoustom==1) {
       path = @"setting/IgnoreUnreadCustomize";
    }else{
       path = @"setting/IgnoreUnread";
    
    }
    [HttpClient postWithParam:@{@"memberId":model.id} withUrl:path block:^(id result, NSError *error) {
        if (result && !error && [result[@"status"] integerValue] == 0) {
            [self request];
        }
    }];
}

#pragma mark tableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyMessageCell"];
    MessageModel *model = _dataList[indexPath.row];
    
    cell.msgDate.text = model.createDate;
    if(_isCoustom==1){
     cell.contentMsg.text = [NSString stringWithFormat:@"定制商品：%@\n电话号码：%@\n%@",model.productName,model.phone,model.content];
    }else{
        cell.contentMsg.text = [NSString stringWithFormat:@"电话号码：%@\n%@",model.phone,model.content];};
    
    if ([model.isRead integerValue] == 0) {
        cell.leftImage.image = [UIImage imageNamed:@"NOReadMessage"];
    } else {
        cell.leftImage.image = [UIImage imageNamed:@"MyMessage"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = _dataList[indexPath.row];
    NSDictionary *dict = @{
                           @"id":model.id,
                           };
    
    NSString *path ;
    if (_isCoustom==1) {
        path = @"setting/findCustomizeDetails";
    }else{
        path = @"setting/findMessageBoardDetails";
    }
    
    [HttpClient postWithParam:dict withUrl:path block:^(id result, NSError *error) {
        if (!error) {
            if (result[@"status"] && [result[@"status"] integerValue] == 0) {
                ((MessageModel *)_dataList[indexPath.row]).isRead = @"1";
                [self.tableView reloadRow:indexPath.row inSection:indexPath.section withRowAnimation:UITableViewRowAnimationNone];
            } else {
                
            }
        }
        MessageDetailVC *detail = [[MessageDetailVC alloc] init];
        detail.model  = _dataList[indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    }];
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
