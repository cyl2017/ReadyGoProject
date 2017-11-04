//
//  YYTableData.m
//  innmall
//
//  Created by sandyrilla on 17/5/15.
//  Copyright © 2017年 xxxxxx. All rights reserved.
//

#import "YYTableData.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - - LLGroupData
@interface YYGroupData ()
@property (nonatomic, strong) NSMutableArray *rows;
@end

@implementation YYGroupData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = nil;
        _rows = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)rows
{
    return [NSArray arrayWithArray:_rows];
}

- (NSUInteger)count
{
    return [_rows count];
}

- (void)addRow:(id<YYRowData>)anObject
{
    if (anObject == nil) {
        return;
    }
    [_rows addObject:anObject];
}

- (void)insertRow:(id<YYRowData>)anObject AtIndex:(NSUInteger)index
{
    if (anObject == nil) {
        return;
    }
    [_rows insertObject:anObject atIndex:index];
}

- (nullable id<YYRowData>)rowAtIndex:(NSUInteger)index
{
    if (index < _rows.count) {
        return _rows[index];
    }
    return nil;
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    if (index < _rows.count) {
        [_rows removeObjectAtIndex:index];
    }
}

- (void)removeAllObjects
{
    [_rows removeAllObjects];
}

- (NSString *)description {
    return @"";
}

@end

#pragma mark - - YYTableData
@interface YYTableData ()
@property (nonatomic, strong) NSMutableArray<YYGroupData *> *groups;
@end

@implementation YYTableData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _groups = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)groups
{
    return [NSArray arrayWithArray:_groups];
}

- (NSUInteger)groupsCount
{
    return _groups.count;
}

- (NSUInteger)rowsCountAtSection:(NSUInteger)section
{
    if (section < _groups.count) {
        return [_groups[section] count];
    }
    return 0;
}

- (nullable __kindof YYGroupData *)groupAtIndex:(NSUInteger)index
{
    if (index < _groups.count) {
        return _groups[index];
    }
    return nil;
}

- (nullable id<YYRowData>)rowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < _groups.count) {
        YYGroupData * group = _groups[indexPath.section];
        if (indexPath.row < group.rows.count) {
            return group.rows[indexPath.row];
        }
    }
    return nil;
}

- (void)addGroup:(__kindof YYGroupData *)group
{
    if (group == nil) {
        return;
    }
    [_groups addObject:group];
}

- (YYGroupData *)addGroup
{
    YYGroupData * group = [[YYGroupData alloc] init];
    [_groups addObject:group];
    return group;
}

- (YYGroupData *)addGroupWithTitle:(NSString *)groupTitle
{
    YYGroupData * group = [[YYGroupData alloc] init];
    group.title = groupTitle;
    [_groups addObject:group];
    return group;
}

- (void)removeObjectAtIndexPath:(NSIndexPath *)indexPath
{
    YYGroupData * group = [self groupAtIndex:indexPath.section];
    if (group) {
        [group removeObjectAtIndex:indexPath.row];
        if ([group count] == 0) {
            [_groups removeObject:group];
        }
    }
}

- (void)removeGroup:(YYGroupData *)group
{
    [_groups removeObject:group];
}

- (NSString *)description {
    return @"";
}

@end

NS_ASSUME_NONNULL_END
