//
//  ShopCarItem.h
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface ShopCarItem : BMBaseModel
@property (nonatomic,copy) NSString *merchantId;
@property (nonatomic,copy) NSString *merchantName;
@property (nonatomic,copy) NSString *commodityId;
@property (nonatomic,copy) NSString *commodityName;
@property (nonatomic,copy) NSString *commodityPrice;
@property (nonatomic,copy) NSString *imageUrl;
@property (nonatomic,copy) NSString *shoppingCartId;
@property (nonatomic,copy) NSString *quantity;
@property (nonatomic,copy) NSString *memberId;
@property (nonatomic,copy) NSString *specificationId;
@property (nonatomic,copy) NSString *specificationName;
@property (nonatomic,copy) NSString *specificationPrice;
@property (nonatomic,copy) NSString *specificationSupplyCount;

@end
