//
// Created by 陈宇 on 15/11/4.
// Copyright (c) 2015 陈宇. All rights reserved.
//

#import "UITableView+EmptyDataSource.h"


@implementation UITableView (EmptyDataSource)

- (void)showEmpty {
    UILabel *emptyMsg = [UILabel new];
    emptyMsg.font = [UIFont systemFontOfSize:14.f];
    emptyMsg.textColor = BMColor(170, 170, 170);
    emptyMsg.text = @"没有更多数据了";
}

@end
