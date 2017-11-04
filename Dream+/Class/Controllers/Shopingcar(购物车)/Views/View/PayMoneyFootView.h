//
//  PayMoneyFootView.h
//  Dream+
//
//  Created by macbook on 2017/10/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayMoneyFootView : UIView
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;//商品总额：
@property (weak, nonatomic) IBOutlet UILabel *yunFei;//+运费：
@property (weak, nonatomic) IBOutlet UILabel *payMoney;//实付款：
+(instancetype)PayMoneyFootViewWithOwnNib;
@end
