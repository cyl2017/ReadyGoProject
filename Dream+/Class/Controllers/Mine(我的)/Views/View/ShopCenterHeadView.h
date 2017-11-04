//
//  ShopCenterHeadView.h
//  Dream+
//
//  Created by macbook on 2017/10/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCenterHeadView : UIView
@property (weak, nonatomic) IBOutlet UILabel *NumbLabel;
@property (weak, nonatomic) IBOutlet UIButton *teamCenterBtn;
+(instancetype)headViewWithOwnNib;
- (IBAction)teamCenterBtnClick:(id)sender;

@end
