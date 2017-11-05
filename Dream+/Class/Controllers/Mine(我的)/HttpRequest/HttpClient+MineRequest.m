//
//  HttpClient+MineRequest.m
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HttpClient+MineRequest.h"
#import "LoadingHook.h"
@implementation HttpClient (MineRequest)
-(void)findCollectionListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    
    BMRequest *request = [BMRequest requestWithPath:@"collection/findCollectionList"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /member/findPersonDetail 查询个人信息
-(void)findPersonDetailParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"member/findPersonDetail"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
@end
