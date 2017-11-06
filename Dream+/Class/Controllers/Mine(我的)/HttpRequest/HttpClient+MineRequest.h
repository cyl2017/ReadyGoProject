//
//  HttpClient+MineRequest.h
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface HttpClient (MineRequest)
//查询商品收藏 1
-(void)findCollectionListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
//查询个人信息 1
-(void)findPersonDetailParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
// 更新个人信息
-(void)updatePersonDetailParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
// 查询帮助中心列表 1
-(void)findHelpCenterListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
// 删除地址
-(void)deleteAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
// 查询所有地址
-(void)findAllAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
// 查询默认地址
-(void)findDefaultAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
// 添加或者编辑地址
-(void)saveOrUpdateAddressParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
// 删除收藏 1
-(void)deleteCollectionParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;

@end
