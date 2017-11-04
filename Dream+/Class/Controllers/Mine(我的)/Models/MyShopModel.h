//
//  MyShopModel.h
//  WenDao
//
//  Created by 黄斌 on 2017/4/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyShopModel : NSObject
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *productName;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *describe;
@property (nonatomic,assign) BOOL isDelete;
@end
