//
//  RegistVC.h
//  Dream+
//
//  Created by liuke on 2017/10/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LKBaseViewController.h"

@interface RegistVC : LKBaseViewController
@property (nonatomic ,copy) void(^registBlock)(NSString *cellphone);
@end
