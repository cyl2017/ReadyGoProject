//
//  ProductCategoryHeader.h
//  Dream+
//
//  Created by liuke on 2017/10/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"
@interface ProductCategoryHeader : UIView
@property (strong, nonatomic) IBOutlet UIButton *imgBtn;
@property (strong, nonatomic) IBOutlet UILabel *categoryName;
@property (strong, nonatomic) CategoryModel *model;

@end
