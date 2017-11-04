//
//  HttpClient+AboutLogin.m
//  Dream+
//
//  Created by liuke on 2017/11/2.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HttpClient+AboutLogin.h"
#import "LoadingHook.h"
@implementation HttpClient (AboutLogin)
//获取验证码
- (void)getVerifyCodeWithParam:(NSDictionary *)param CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"verifyCode/getVerifyCode"];
    request.requestParams = param;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
    
    
}
@end
