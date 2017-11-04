//
//  UIImageView+BM.m
//  ZPM
//
//  Created by 陈宇 on 15/3/30.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import "UIImageView+BM.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (BM)

- (void)setImageWithUrl:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)setImageWithUrl:(NSString *)url placeHolder:(NSString *)placeHolder
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeHolder]];
}

@end
