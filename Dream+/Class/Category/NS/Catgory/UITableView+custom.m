//
//  UITableView+custom.m
//  XSGJ
//
//  Created by Colin on 14-6-4.
//  Copyright (c) 2014年 flagsky. All rights reserved.
//

#import "UITableView+custom.h"

@implementation UITableView (custom)

- (void)showNoDataWithTitle:(NSString *)title image:(UIImage *)image
{
    [self hiddenNoData];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    imgView.frame = CGRectMake((self.width-image.size.width)/2, self.height/2-image.size.height, image.size.width, image.size.height);
    [self addSubview:imgView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imgView.bottom, self.width, 20)];
    label.text = title;
   // label.font = kDefaultFont;
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
}

- (void)hiddenNoData
{
    for (UIView *view in [self subviews])
    {
        if ([view isKindOfClass:[UILabel class]]||[view isKindOfClass:[UIImageView class]])
        {
            [view removeFromSuperview];
        }
    }
}

@end
