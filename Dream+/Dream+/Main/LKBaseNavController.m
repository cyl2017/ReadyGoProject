//
//  LKBaseNavController.m
//  ZhiShiStone
//
//  Created by liuke on 2017/2/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LKBaseNavController.h"

@interface LKBaseNavController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>


@end

@implementation LKBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    //统一导航栏的颜色 以及字号等
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];// 电池条，白色
    [self.navigationBar setBarTintColor:BMColor(24, 25, 26)];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                                
                                                 NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    if ([self.viewControllers count] >1)
        [self checkItem:viewController];
}

- (void)checkItem:(UIViewController *)viewController
{
    UIImage *leftImage = [[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage
                                                                                       style:UIBarButtonItemStylePlain
                                                                                      target:self
                                                                                      action:@selector(back)];
}
- (void)back

{
    [self popViewControllerAnimated:YES];
}



@end
