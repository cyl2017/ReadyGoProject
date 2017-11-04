//
//  HttpClient+AboutLogin.h
//  Dream+
//
//  Created by liuke on 2017/11/2.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface HttpClient (AboutLogin)
//获取验证码
- (void)getVerifyCodeWithParam:(NSDictionary *)param CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
//注册
- (void)memberRegisterWithParam:(NSDictionary *)param CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
//登录
- (void)memberLoginWithParam:(NSDictionary *)param CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;

//忘记密码  POST /member/forgetPassword
- (void)memberForgetPasswordWithParam:(NSDictionary *)param CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
@end
