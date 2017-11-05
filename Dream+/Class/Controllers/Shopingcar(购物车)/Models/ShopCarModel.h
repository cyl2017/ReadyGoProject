//
//  ShopCarModel.h
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface ShopCarModel : BMBaseModel
@property (nonatomic,copy) NSString *merchantId;
@property (nonatomic,copy) NSString *merchantName;
@property (nonatomic,retain) NSMutableArray *shoppingCartItems;

@end
