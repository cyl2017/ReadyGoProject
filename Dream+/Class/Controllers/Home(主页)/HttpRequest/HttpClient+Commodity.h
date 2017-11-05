//
//  HttpClient+Commodity.h
//  Dream+
//
//  Created by liuke on 2017/11/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface HttpClient (Commodity)
//商品列表 /commodity/findCommodityList
-(void)commodityFindCommodityListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;
@end
