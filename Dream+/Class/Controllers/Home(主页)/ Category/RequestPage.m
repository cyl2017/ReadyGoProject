//
//  RequestPage.m
//  WenDao
//
//  Created by liuke on 2017/4/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RequestPage.h"

@implementation RequestPage

+ (instancetype)defaultPage
{
    RequestPage *page = [[self alloc] init];
    page.pageNo = 0;
    page.totalPage = page.pageNo + 1;
    return page;
}

- (instancetype)init
{
    if (self = [super init]) {
        _pageSize = 10;
    }
    return self;
}

- (NSMutableDictionary *)nextPage
{
    if (_pageNo >= _totalPage) {
        return nil;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:2];
    params[@"pageNo"] = @(_pageNo + 1);
    params[@"pageSize"] = @(_pageSize);
    return params;
}

@end
