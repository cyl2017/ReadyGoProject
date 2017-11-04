//
//  GoodsDetailModel.m
//  WenDao
//
//  Created by 黄斌 on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "GoodsDetailModel.h"

@implementation GoodsDetailModel

+(NSDictionary*)mj_replacedKeyFromPropertyName
{
    return @{@"productsNew":@"newProducts",
             @"ID":@"id"};
}

@end
