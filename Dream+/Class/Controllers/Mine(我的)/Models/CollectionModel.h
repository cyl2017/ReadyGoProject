//
//  CollectionModel.h
//  Dream+
//
//  Created by macbook on 2017/11/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface CollectionModel : BMBaseModel
@property (nonatomic,copy) NSString *memberId;
@property (nonatomic,copy) NSString *collectionId;
@property (nonatomic,copy) NSString *commodityId;
@property (nonatomic,copy) NSString *commodityName;
@property (nonatomic,copy) NSString *commodityPrice;
@property (nonatomic,copy) NSString *commodityImageUrl;
@property (nonatomic,copy) NSString *merchantId;
@property (nonatomic,copy) NSString *merchantName;
@property (nonatomic,copy) NSString *merchantImageUrl;

@end
