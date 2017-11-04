//
//  PayHeadTableView.h
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayHeadTableView : UIView
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
+(instancetype)payHeadTableViewWithOwnNib;
@end
