//
//  PayTableViewCell.h
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *payTitle;
@property (weak, nonatomic) IBOutlet UIImageView *payPhoto;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *count;

@end
