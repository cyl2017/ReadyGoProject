//
//  ShopCarTabelHeadView.h
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShopCarTabelHeadView;

@protocol ShopCarTabelHeadViewDelegate <NSObject>

- (void)editBtnClick:(UIButton*)editBtn;

@end

@interface ShopCarTabelHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (nonatomic, assign) id<ShopCarTabelHeadViewDelegate> delegate;
+(instancetype)shopCarTabelHeadViewWithOwnNib;
- (IBAction)selectBtnClick:(id)sender ;
@end
