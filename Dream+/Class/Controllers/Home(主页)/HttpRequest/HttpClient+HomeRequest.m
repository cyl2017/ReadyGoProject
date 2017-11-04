//
//  HttpClient+HomeRequest.m
//  WenDao
//
//  Created by liuke on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HttpClient+HomeRequest.h"
#import "LoadingHook.h"
@implementation HttpClient (HomeRequest)
//首页广告
-(void)findBannerListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle{

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
