//
//  PayMoneyHeadView.h
//  Dream+
//
//  Created by macbook on 2017/10/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayMoneyHeadView : UIView
@property (weak, nonatomic) IBOutlet UILabel *orderTitle;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
+(instancetype)payMoneyHeadTableViewWithOwnNib;
@end
