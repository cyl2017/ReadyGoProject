//
//  UIImageView+BM.h
//  ZPM
//
//  Created by 陈宇 on 15/3/30.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BM)

/**
 *  通过url地址设置imageview的图片
 */
- (void)setImageWithUrl:(NSString *)url;

/**
 *  通过url地址设置imageview的图片
 *  @param url         图片url地址
 *  @param placeHolder 占位图片
 */
- (void)setImageWithUrl:(NSString *)url placeHolder:(NSString *)placeHolder;

@end
