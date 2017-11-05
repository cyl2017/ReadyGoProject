//
//  ShopCarModel.m
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShopCarModel.h"

@implementation ShopCarModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{ @"shoppingCartItems" : @"ShopCarItem"
             
              };
}
@end
