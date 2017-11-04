//
//  BMActionSheet.h
//  Alarm
//
//  Created by 黄斌 on 2016/12/2.
//  Copyright © 2016年 ronaldwong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^onClickBlock)(UIButton *button);

@interface BMActionSheet : UIView

- (instancetype)initWithArray:(NSArray <NSString *>*)titles;

@property (nonatomic,copy) onClickBlock block;
- (void)onClick:(onClickBlock)block;

@property (nonatomic,assign) NSInteger number;
@property (nonatomic,strong) UIColor *color;

@end
