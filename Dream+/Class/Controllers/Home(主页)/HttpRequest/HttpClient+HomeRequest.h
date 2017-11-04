//
//  HttpClient+HomeRequest.h
//  WenDao
//
//  Created by liuke on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface HttpClient (HomeRequest)

//首页广告
-(void)findBannerListParams:(NSDictionary*)para CompleteleHandek:(void(^)(NSDictionary *data,NSError *error))completeHandle;







@end
