//
//  CategoryModel.h
//  WenDao
//
//  Created by liuke on 2017/3/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>
#import "SecondCategoryModel.h"
@interface CategoryModel : BMBaseModel
@property (nonatomic,copy) NSString *categoryId;//一级分类ID
@property (nonatomic,copy) NSString *typeName;//一级分类名称
@property (nonatomic,copy) NSString *img1;//图片
@property (nonatomic,strong)NSArray <SecondCategoryModel*> *next;//二级分类集合
@property (nonatomic,assign)BOOL isSelected;
@end
