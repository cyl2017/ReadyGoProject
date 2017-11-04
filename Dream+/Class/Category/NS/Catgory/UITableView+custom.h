//
//  UITableView+custom.h
//  XSGJ
//
//  Created by Colin on 14-6-4.
//  Copyright (c) 2014年 flagsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (custom)

/**
 *  table没有数据时提示
 *
 *  @param title 提示语
 *  @param image 提示图片
 */
- (void)showNoDataWithTitle:(NSString *)title image:(UIImage *)image;

/**
 *  隐藏(删除)没有数据的提示
 */
- (void)hiddenNoData;

@end
