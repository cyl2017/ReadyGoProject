//
//  LKBaseViewController.h
//  ZhiShiStone
//
//  Created by liuke on 2017/2/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMCover.h"
@interface LKBaseViewController : UIViewController
@property (nonatomic,strong)BMCover *cover;
- (UIBarButtonItem *)createItem:(UIImage *)image title:(NSString *)title action:(SEL)action ;
@end
