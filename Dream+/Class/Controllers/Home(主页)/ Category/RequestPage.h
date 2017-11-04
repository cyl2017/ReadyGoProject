//
//  RequestPage.h
//  WenDao
//
//  Created by liuke on 2017/4/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface RequestPage : BMBaseModel

@property (nonatomic, assign) NSInteger pageNo;//第几页
@property (nonatomic, assign) NSUInteger pageSize;
@property (nonatomic, assign) NSUInteger total;
@property (nonatomic, assign) NSUInteger totalPage;

/**
 *  生成一个默认的page对象，默认pageSize为15，pageNo为1;
 */
+ (instancetype)defaultPage;

- (NSMutableDictionary *)nextPage;
@end
