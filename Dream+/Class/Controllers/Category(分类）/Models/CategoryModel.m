//
//  CategoryModel.m
//  WenDao
//
//  Created by liuke on 2017/3/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel
+(NSDictionary*)mj_objectClassInArray{
    
  return @{@"next": [SecondCategoryModel class]};
    
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"categoryId":@"id"};
}
@end
