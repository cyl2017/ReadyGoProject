//
//  LocationModel.h
//  WenDao
//
//  Created by liuke on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface LocationModel : BMBaseModel
@property (nonatomic,copy)NSString *selectedCity;
@property (nonatomic,copy)NSString *locationCity;
@property (nonatomic,copy)NSString *longitude;
@property (nonatomic,copy)NSString *latitude;
@property (nonatomic,copy)NSString *cityId;

@end
