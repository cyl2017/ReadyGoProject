//
//  SecondCategoryModel.h
//  WenDao
//
//  Created by liuke on 2017/4/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface SecondCategoryModel : BMBaseModel
@property (nonatomic,copy) NSString *secondCategoryId;//二级级分类ID
@property (nonatomic,copy) NSString *typeName;//二级级分类名称
@property (nonatomic,assign)BOOL isSelected;
@end
