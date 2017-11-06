//
//  HelpCenterViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/25.
//  Copyright © 2017年 Apple. All rights reserved.
//
#import "HelpInfoModel.h"
#import "HttpClient+MineRequest.h"
#import "HelpCenterViewController.h"
#import "QRCodeViewController.h"
@interface HelpCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) UITableView * tableView;//list
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation HelpCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = @[@"瑞迪购商城简介",@"注册协议",@"关于充值问题的通知",@"关于购物充值问题",@"充值到账问题补充"];
     [self getHelpList];
     [self setTableView];
    
}
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(10,0, kScreenWidth-20, kScreenHeight ) style:UITableViewStyleGrouped];
    tableView.bounces = YES;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"helpCell"];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    
}
#pragma mark --- 查询帮助中心列表接口
-(void)getHelpList{
    NSMutableDictionary *params =[NSMutableDictionary dictionary];
    
    [[HttpClient sharedInstance]findHelpCenterListParams:params CompleteleHandek:^(NSDictionary *data, NSError *error) {
        if (data) {
            _dataSource = [HelpInfoModel mj_objectArrayWithKeyValuesArray:data[@"list"]];
            [_tableView reloadData];
        }
        
    }];
    
}

#pragma mark - UITableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60;
    
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell respondsToSelector:@selector(tintColor)]) {
        CGFloat cornerRadius = 5.f;
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        CGMutablePathRef pathRef = CGPathCreateMutable();
        CGRect bounds = CGRectInset(cell.bounds, 0, 0);
        BOOL addLine = NO;
        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
        } else if (indexPath.row == 0) {
            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
            //            addLine = YES;
        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        } else {
            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
            CGPathMoveToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
            //            addLine = YES;
        }
        layer.path = pathRef;
        CFRelease(pathRef);
        //set the border color
        layer.strokeColor =[UIColor lightGrayColor].CGColor;
        //set the border width
        layer.lineWidth = 1;
        layer.fillColor = [UIColor colorWithWhite:1.f alpha:1.0f].CGColor;
        
        
        if (addLine == YES) {
            CALayer *lineLayer = [[CALayer alloc] init];
            CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
            lineLayer.frame = CGRectMake(CGRectGetMinX(bounds), bounds.size.height-lineHeight, bounds.size.width, lineHeight);
            lineLayer.backgroundColor = tableView.separatorColor.CGColor;
            [layer addSublayer:lineLayer];
        }
        
        UIView *testView = [[UIView alloc] initWithFrame:bounds];
        [testView.layer insertSublayer:layer atIndex:0];
        testView.backgroundColor = UIColor.clearColor;
        cell.backgroundView = testView;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"helpCell"];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"helpCell"];
    }
    if (_dataSource.count > indexPath.section)
    {
        HelpInfoModel *model =  _dataSource[indexPath.section];
        cell.textLabel.font = FONT(15);
        cell.textLabel.text = model.question;
        
    }
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    HelpInfoModel *model =  _dataSource[indexPath.section];
    QRCodeViewController* infoVC=[[QRCodeViewController alloc]init];
    infoVC.url = [NSURL URLWithString:model.answer];
    [self.navigationController pushViewController:infoVC animated:YES];
    
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
