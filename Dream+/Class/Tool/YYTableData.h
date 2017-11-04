//
//  YYTableData.h
//  innmall
//
//  Created by sandyrilla on 17/5/15.
//  Copyright © 2017年 xxxxxx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - - YYRowData
@protocol YYRowData <NSObject>
@property (nonatomic, assign) CGFloat rowHeight;
@end


@protocol YYFormRow <YYRowData>
@property (nonatomic, assign) NSInteger rowType;
@property (nonatomic, strong) NSDictionary * actionDic;
@end

#pragma mark - - YYGroupData
@interface YYGroupData : NSObject

@property (nonatomic, strong, nullable) NSString *title;

- (NSArray *)rows;

- (NSUInteger)count;
- (void)addRow:(id<YYRowData>)anObject;
- (void)insertRow:(id<YYRowData>)anObject AtIndex:(NSUInteger)index;
- (nullable id<YYRowData>)rowAtIndex:(NSUInteger)index;

- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeAllObjects;
@end

#pragma mark - - YYTableData
@interface YYTableData : NSObject

- (NSArray *)groups;

- (NSUInteger)groupsCount;
- (NSUInteger)rowsCountAtSection:(NSUInteger)section;
- (nullable __kindof YYGroupData *)groupAtIndex:(NSUInteger)index;
- (nullable id<YYRowData>)rowAtIndexPath:(NSIndexPath *)indexPath;

- (void)addGroup:(__kindof YYGroupData *)group;
- (YYGroupData *)addGroup;
- (YYGroupData *)addGroupWithTitle:(NSString *)groupTitle;

- (void)removeObjectAtIndexPath:(NSIndexPath *)indexPath;
- (void)removeGroup:(YYGroupData *)group;
@end

NS_ASSUME_NONNULL_END
