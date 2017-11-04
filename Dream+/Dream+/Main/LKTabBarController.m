//
//  LKTabBarController.m
//  ZhiShiStone
//
//  Created by liuke on 2017/2/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LKTabBarController.h"
#import "LKBaseViewController.h"
#import "HomeVC.h"
#import "CategoryVC.h"
#import "MineVC.h"
#import "LoginVC.h"
#import "ShopingCarVC.h"
#import "ToolClass.h"
#define ControllerArry @[@"HomeVC",@"CategoryVC",@"ShopingCarVC",@"MineVC"]
#define TabBarTitle @[@"首页",@"分类",@"购物车",@"我的"]
#define NavItemTitle @[@"瑞迪购",@"分类",@"购物车",@"我的"]
#define TabBarImage @[@"tabbar_home",@"tabbar_category",@"tabbar_shopingcar",@"tabbar_membercenter"]
#define TabBarSelectImage @[@"tabbar_home_select",@"tabbar_category_select",@"tabbar_shopingcar_select",@"tabbar_membercenter_select"]

@interface LKTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) NSMutableArray *controllerArray;


@end

@implementation LKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self.tabBar setTintColor:BMColor(251, 0, 27)];
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    self.controllerArray = [NSMutableArray array];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < ControllerArry.count; i ++ ) {
        LKBaseViewController *viewCtrl = (LKBaseViewController *)[[NSClassFromString(ControllerArry[i]) alloc] init];
        LKBaseNavController *nav = [[LKBaseNavController alloc] initWithRootViewController:viewCtrl];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:TabBarTitle[i]
                                                           image:[[UIImage imageNamed:TabBarImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                   selectedImage:[[UIImage imageNamed:TabBarSelectImage[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        nav.tabBarItem = item;
        viewCtrl.hidesBottomBarWhenPushed = NO;
        viewCtrl.navigationItem.title = NavItemTitle[i];
        [self.controllerArray addObject:viewCtrl];
        [array addObject:nav];
    }
    self.viewControllers = array;
    self.selectedIndex =0;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([[(UINavigationController *)viewController visibleViewController] isKindOfClass:[HomeVC class]]){
        self.Itemsindex = 0;
    }else if ([[(UINavigationController *)viewController visibleViewController] isKindOfClass:[CategoryVC class]]) {
        self.Itemsindex = 1;
    }else if ([[(UINavigationController *)viewController visibleViewController] isKindOfClass:[ShopingCarVC class]]) {
        self.Itemsindex = 2;
    }else if ([[(UINavigationController *)viewController visibleViewController] isKindOfClass:[MineVC class]]){
        self.Itemsindex = 3;
    }
    if (![[(UINavigationController *)viewController visibleViewController] isKindOfClass:[HomeVC class]]&&![[(UINavigationController *)viewController visibleViewController] isKindOfClass:[CategoryVC class]]&&![user boolForKey:@"login"]) {
        LKBaseNavController *nav=[[LKBaseNavController alloc]initWithRootViewController:[LoginVC new]];
        [self presentViewController:nav animated:YES completion:^{
            
        }];
        return NO;
    }
    return YES;
}

-(void)cleanBlackLine{
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [self.tabBar setBackgroundImage:img];
    
    [self.tabBar setShadowImage:img];
    

}

- (LKBaseNavController *)presentLoginViewController
{
    LKBaseNavController *loginViewController = [[LKBaseNavController alloc] initWithRootViewController:[LoginVC new]];
    [self presentViewController:loginViewController animated:YES completion:nil];
    return loginViewController;
}
@end
