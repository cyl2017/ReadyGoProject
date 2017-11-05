//
//  HttpClient+Commodity.m
//  Dream+
//
//  Created by liuke on 2017/11/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HttpClient+Commodity.h"

@implementation HttpClient (Commodity)
//商品查询
-(void)commodityFindCommodityListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{
    
    BMRequest *request = [BMRequest requestWithPath:@"banner/findBannerList"];
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
