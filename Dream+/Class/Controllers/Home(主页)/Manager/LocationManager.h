//
//  LocationManager.h
//  WenDao
//
//  Created by liuke on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationModel.h"
@interface LocationManager : NSObject
@property (nonatomic,strong) LocationModel *model;


+(instancetype) shareInstance;
@end
