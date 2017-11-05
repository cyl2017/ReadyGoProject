//
//  HttpClient+ShoppingCartRequest.m
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HttpClient+ShoppingCartRequest.h"
#import "LoadingHook.h"
@implementation HttpClient (ShoppingCartRequest)
-(void)addShoppingCartParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    
    BMRequest *request = [BMRequest requestWithPath:@"shoppingCart/addShoppingCart"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];

}
-(void)deleteShoppingCartsParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"shoppingCart/deleteShoppingCarts"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
-(void)findShoppingCartListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"shoppingCart/findShoppingCartList"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
-(void)balanceByCartParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/balanceByCart"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
-(void)balanceRightNowParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/balanceRightNow"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
    
}
-(void)cancelOrderParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/cancelOrder"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /order/commentProduct 评价商品
-(void)commentProductParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/commentProduct"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
// /order/confirmReceipt 确认收货
-(void)confirmReceiptParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/confirmReceipt"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}

//POST /order/deleteOrder 删除订单
-(void)deleteOrderParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/deleteOrder"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /order/findMyOrders 查询订单
-(void)findMyOrdersParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/findMyOrders"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /order/findOrderDetail 查询订单详情
-(void)findOrderDetailParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/findOrderDetail"];
    request.requestParams = para;
    [request addIgonreHookClass:[LoadingHook class]];
    [self startRequest:request finish:^(BMResponse *response) {
        completeHandle(response.rawResult,nil);
    } failureHandler:^(NSError *error) {
        [BMToast makeText:error.localizedDescription];
        completeHandle(nil, error);
    }];
}
//POST /order/sumbitOrder 提交订单
-(void)sumbitOrderParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    BMRequest *request = [BMRequest requestWithPath:@"order/sumbitOrder"];
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
