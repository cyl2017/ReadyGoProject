//
//  BMStartViewController.m
//  ZhiShiStone
//
//  Created by liuke on 2017/2/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BMStartViewController.h"
#import "LKTabBarController.h"
#define kStartImage @[@"start_one",@"start_two",@"start_three"]

@interface BMStartViewController ()

@property (nonatomic,assign) NSInteger pageNum;
@property (nonatomic,strong) UIScrollView *scrollView;

@end


@implementation BMStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.edgesForExtendedLayout = UIRectEdgeNone;
    [self accessApplication];
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews
{
    self.scrollView.contentSize = CGSizeMake(kScreen_Width*self.pageNum, 0);
}

//#pragma mark -- 显示新版本特性
- (void)showNewFeature
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
    for (int i = 0; i < self.pageNum; i ++ ) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreen_Width*i, 0, kScreen_Width, kScreen_Height)];
        imgView.image = [UIImage imageNamed:kStartImage[i]];
        imgView.backgroundColor = [UIColor clearColor];
        [self.scrollView addSubview:imgView];
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(accessApplication)
     forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(kScreen_Width*(self.pageNum-1));
        make.top.mas_equalTo(kScreen_Height*0.825);
        make.width.mas_equalTo(kScreen_Width/5*2);
        make.height.mas_equalTo(kScreen_Height*0.05);
    }];
}

#pragma mark -- 进入应用
- (void)accessApplication
{
    [self checkPreviewFeatureVersion];
    LKTabBarController *tabbar = [[LKTabBarController alloc] init];
    [self presentViewController:tabbar animated:NO completion:^{
        
    }];
    
}

#pragma mark -- 更改缓存里的版本号,避免下去启动还显示版本特性页面
- (void)checkPreviewFeatureVersion
{
    if (self.pageNum>1) {
        NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:version forKey:kPreviewFeatureVersion];
        [userDefaults synchronize];
    }
}

#pragma mark -- 是否需要显示版本新特性页面
- (BOOL)checkShowNewFeature
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *previewFeatureVersion = [userDefaults stringForKey:kPreviewFeatureVersion];
    
    if (!previewFeatureVersion) return YES;
    
    NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    if ([previewFeatureVersion isEqualToString:version]) {
        return NO;
    }
    return YES;
}

- (UIButton *)createButtonWithTitle:(NSString *)title action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = kDefaultFont;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}



@end
