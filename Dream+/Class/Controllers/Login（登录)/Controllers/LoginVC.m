//
//  LoginVC.m
//  Dream+
//
//  Created by liuke on 2017/10/27.
//  Copyright © 2017年 Apple. All rights reserved.
//
#import "RegistVC.h"
#import "ForgetPassWord.h"
#import "LoginVC.h"
#import "ToolClass.h"
#import "CategoryVC.h"
@interface LoginVC ()
@property (strong, nonatomic) IBOutlet UITextField *accountNum;//账号
@property (strong, nonatomic) IBOutlet UITextField *passWord;//m密码

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ClickAction:(UIButton *)sender {
    
    // 0 1 2 登录 注册 忘记密码
    switch (sender.tag) {
        case 0:
            {
                if (![ToolClass validateMobile:_accountNum.text]) {
                    [BMToast makeText:@"请输入正确的手机号" offset:140.f];
                    return;
                }else if(_passWord.text.length==0){
                    [BMToast makeText:@"密码不能为空" offset:140.f];
                    
                    return;
                }
             
                [self loginBackState];
            }
            break;
        case 1:
        {
                RegistVC *regist  = [RegistVC new];
         
                [self.navigationController pushViewController:regist animated:YES];
            

        }
            break;
        case 2:
        {
            ForgetPassWord *Forget  = [ForgetPassWord new];
  
            [self.navigationController pushViewController:Forget animated:YES];

        }
            break;

      

    }
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden =YES;

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;

}

- (IBAction)backToViewController:(UIButton *)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
    UITabBarController * tabbar = (UITabBarController *)self.navigationController.presentingViewController;
    if (tabbar.selectedIndex==1) {
        [tabbar setSelectedIndex:1];
    }else{
        [tabbar setSelectedIndex:0];
       
    }
}


#pragma mark loginBackState
-(void)loginBackState{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    [user setBool:YES forKey:@"login"];
    [user synchronize];
   
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    LKTabBarController * tabbar = (LKTabBarController *)self.navigationController.presentingViewController;
    if (tabbar.Itemsindex==2) {
        [tabbar setSelectedIndex:2];
    }else if (tabbar.Itemsindex==3){
        [tabbar setSelectedIndex:3];
        NSArray *array = tabbar.viewControllers;
        UINavigationController *nav = array[3];
        [nav popToRootViewControllerAnimated:NO];
    }

}

         




@end
