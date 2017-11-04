//
//  AdvertiseModel.h
//  WenDao
//
//  Created by liuke on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface AdvertiseModel : BMBaseModel
@property (nonatomic,copy) NSString *bannerId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *createTime;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *objectType;
@property (nonatomic,copy) NSString *objectContent;
@property (nonatomic,copy) NSString *place;
@end
