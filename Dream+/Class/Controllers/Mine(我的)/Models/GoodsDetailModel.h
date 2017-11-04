//
//  GoodsDetailModel.h
//  WenDao
//
//  Created by 黄斌 on 2017/4/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsDetailModel : NSObject

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *productName;
@property (nonatomic,copy) NSString *manufactorName;
@property (nonatomic,assign) BOOL productsNew;
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,copy) NSString *parameter;
@property (nonatomic,copy) NSString *stock;
@property (nonatomic,copy) NSString *specifications;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *describe;
@property (nonatomic,copy) NSString *productIntro;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *image1;
@property (nonatomic,copy) NSString *image2;
@property (nonatomic,copy) NSString *image3;
@property (nonatomic,copy) NSString *image4;
@property (nonatomic,copy) NSString *image5;


@end
