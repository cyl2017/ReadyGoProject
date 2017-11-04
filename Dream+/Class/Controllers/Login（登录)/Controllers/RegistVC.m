//
//  RegistVC.m
//  Dream+
//
//  Created by liuke on 2017/10/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RegistVC.h"
#import "RegistItemsVC.h"
#import "HttpClient+AboutLogin.h"
@interface RegistVC ()
@property (strong, nonatomic) IBOutlet UITextField *telphone;
@property (strong, nonatomic) IBOutlet UITextField *vCode;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UITextField *surePassword;
@property (strong, nonatomic) IBOutlet UITextField *recomenPhone;
@property (strong, nonatomic) IBOutlet UIButton *vBtn;//获取验证码
@property (nonatomic,copy) NSString *code;
@end

@implementation RegistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getCode:(UIButton *)sender {
    //获取验证码
    if ([_telphone.text stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        [BMToast makeText:@"手机号不能为空"];
        return;
    }else if(![ToolClass validateMobile:_telphone.text]){
        [BMToast makeText:@"请输入正确的手机号码"];
        return;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cellphone"] = _telphone.text;
    params[@"type"] = @"0";
    [[HttpClient sharedInstance]getVerifyCodeWithParam:params CompleteleHandek:^(NSDictionary *data, NSError *error) {
        
    }];
    [self countdown:sender];
}

- (IBAction)regist:(UIButton *)sender {
    //注册
    if ([_telphone.text stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        [BMToast makeText:@"手机号不能为空"];
        return;
    }else if(![ToolClass validateMobile:_telphone.text]){
        [BMToast makeText:@"请输入正确的手机号码"];
        return;
    }else if (_vCode.text.length==0){
        [BMToast makeText:@"请输入验证码"];
        return;
    }else if(_passWord.text.length==0||_surePassword.text.length==0){
        [BMToast makeText:@"密码或确认密码不能为空"];
        return;
        
    }else if (![_passWord.text isEqualToString:_surePassword.text]){
        [BMToast makeText:@"两次输入密码不一致"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cellphone"] = _telphone.text;
    params[@"password"] = _passWord.text;
    params[@"verifyCode"] = _vCode.text;
    params[@"inviteCode"] = _recomenPhone.text;
    
    [[HttpClient sharedInstance]memberRegisterWithParam:params CompleteleHandek:^(NSDictionary *data, NSError *error) {
        
         [self.navigationController popViewControllerAnimated:YES];
    }];
    
   
    
    
}

- (IBAction)registItems:(UIButton *)sender {
    
    //注册协议
    
    RegistItemsVC *regist  = [RegistItemsVC new];
    
    [self.navigationController pushViewController:regist animated:YES];
    
}

//倒计时
- (void)countdown:(UIButton *)button
{
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [button setTitleColor:[UIColor colorWithRed:248/255.0 green:126/255.0 blue:9/255.0 alpha:1] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:15];
                [button setTitle:@"获取验证码" forState:UIControlStateNormal];
                button.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 61;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置;
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:13];
                [button setTitle:[NSString stringWithFormat:@"%ds后重新获取",seconds] forState:UIControlStateNormal];
                button.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
