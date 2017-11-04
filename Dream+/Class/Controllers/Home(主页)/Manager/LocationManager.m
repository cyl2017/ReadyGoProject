//
//  LocationManager.m
//  WenDao
//
//  Created by liuke on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager
static LocationManager * _instance = nil;
+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}

-(void)setModel:(LocationModel *)model{

    _model = model;
}
@end
