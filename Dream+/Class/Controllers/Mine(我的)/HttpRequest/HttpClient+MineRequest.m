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
//POST /member/updatePersonDetail 更新个人信息
-(void)updatePersonDetailParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"member/updatePersonDetail"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /helpCenter/findHelpCenterList 查询帮助中心列表
-(void)findHelpCenterListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"helpCenter/findHelpCenterList"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
///address/deleteAddress 删除地址
-(void)deleteAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"address/deleteAddress"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /address/findAllAddress 查询所有地址
-(void)findAllAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"address/findAllAddress"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /address/findDefaultAddress 查询默认地址
-(void)findDefaultAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"address/findDefaultAddress"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /address/saveOrUpdateAddress 添加或者编辑地址
-(void)saveOrUpdateAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"address/saveOrUpdateAddress"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /collection/deleteCollection 删除收藏
-(void)deleteCollectionParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"collection/deleteCollection"];
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
