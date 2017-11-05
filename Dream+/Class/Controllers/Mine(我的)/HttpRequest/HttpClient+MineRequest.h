//
//  HttpClient+MineRequest.h
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface HttpClient (MineRequest)
//查询商品收藏
-(void)findCollectionListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
//查询个人信息
-(void)findPersonDetailParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;

@end
