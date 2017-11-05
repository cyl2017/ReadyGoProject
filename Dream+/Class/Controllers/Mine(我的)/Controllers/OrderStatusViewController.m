//
//  OrderStatusViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OrderStatusViewController.h"
#import "OrderTableViewCell.h"
@interface OrderStatusViewController ()
@property (weak, nonatomic) IBOutlet UIView *emptyView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *selectedLine;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@property (weak, nonatomic) IBOutlet UIButton *pullBtn;
@property (weak, nonatomic) IBOutlet UIButton *finishedBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSelectedLine;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation OrderStatusViewController{
    UIButton *oldButton;
    BOOL isRequest;
    NSInteger PageNum; // 页索引
    NSInteger PageSize; // 单面显示条数
}
- (IBAction)goHomeClick:(id)sender {
}
//tag:1~5
- (IBAction)statusClick:(UIButton *)sender {
    self.leftSelectedLine.constant = kScreen_Width*0.2*(sender.tag-1);
    oldButton.selected = NO;
    sender.selected = YES;
    oldButton = sender;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emptyView.hidden = YES;
    [self setTableView];
    [self selectedStatusButton:self.selectedBtnTag];
}
- (void)selectedStatusButton:(NSInteger)tag{

    switch (tag) {
        case 2:
            [self statusClick:_buyBtn];
            break;
        case 3:
             [self statusClick:_pushBtn];
            break;
        case 4:
            [self statusClick:_pullBtn];
            break;
        case 5:
            [self statusClick:_finishedBtn];
            break;
        default:
              [self statusClick:_allBtn];
            break;
    }
}
- (void)setTableView
{
       _tableView.tableFooterView = [[UIView alloc] init];
      self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(doLoadMore)];
//    [self.tableView.mj_header beginRefreshing];
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"OrderTableViewCell"];
    
}
- (void)loadNewData
{
    if (isRequest) {
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
- (void)requestData
{
    
    NSMutableDictionary *params = @{}.mutableCopy;
    
}
#pragma mark - UITableView delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;

     return _dataSource.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 160;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderTableViewCell"];
    if (_dataSource.count > indexPath.row)
    {
        
    }
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
