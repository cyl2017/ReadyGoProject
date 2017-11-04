//
//  BMCover.h
//  ZPM
//
//  Created by 陈宇 on 15/3/27.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMCover : UIView

+ (id)cover;
+ (id)coverWithTarget:(id)target action:(SEL)action;
- (void)reset;
- (void)dim;

@end
