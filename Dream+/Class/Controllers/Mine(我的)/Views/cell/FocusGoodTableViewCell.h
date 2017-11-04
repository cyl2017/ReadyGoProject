//
//  FocusGoodTableViewCell.h
//  Dream+
//
//  Created by macbook on 2017/10/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FocusGoodTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *focusTitle;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIImageView *goodImage;

@end
