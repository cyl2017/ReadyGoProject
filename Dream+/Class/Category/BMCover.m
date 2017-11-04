//
//  BMCover.m
//  ZPM
//
//  Created by 陈宇 on 15/3/27.
//  Copyright (c) 2015年 蓝色互动. All rights reserved.
//

#import "BMCover.h"

@implementation BMCover

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)reset
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0f];
}

- (void)dim
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
}

+ (id)cover
{
    return [[self alloc] init];
}

+ (id)coverWithTarget:(id)target action:(SEL)action
{
    BMCover *cover = [self cover];
    
    UITapGestureRecognizer *tapOut = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tapOut.delegate =cover;
    [cover addGestureRecognizer:tapOut];
    return cover;
}


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"BMCover"]) {
        return YES;
    }
    return NO;
    
}

@end
