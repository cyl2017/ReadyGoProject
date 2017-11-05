//
//  ModifyPhoneNumbViewController.m
//  Dream+
//
//  Created by macbook on 2017/11/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ModifyPhoneNumbViewController.h"

@interface ModifyPhoneNumbViewController ()
@property (strong, nonatomic) IBOutlet UITextField *telphone;
@property (strong, nonatomic) IBOutlet UITextField *vcode;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UIButton *vBtn;//获取验证码

@end

@implementation ModifyPhoneNumbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationController.title = @"修改手机号";
}

- (IBAction)getCode:(UIButton *)sender {
    //获取验证码
    if ([_telphone.text stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        [BMToast makeText:@"新手机号不能为空"];
        return;
    }else if(![ToolClass validateMobile:_telphone.text]){
        [BMToast makeText:@"请输入正确的手机号码"];
        return;
    }
    [self countdown:sender];
    
    
}

- (IBAction)modifyPassWord:(UIButton *)sender {
    //修改密码
    if ([_telphone.text stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) {
        [BMToast makeText:@"手机号不能为空"];
        return;
    }else if(![ToolClass validateMobile:_telphone.text]){
        [BMToast makeText:@"请输入正确的手机号码"];
        return;
    }else if (_vcode.text.length==0){
        [BMToast makeText:@"请输入验证码"];
        return;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
