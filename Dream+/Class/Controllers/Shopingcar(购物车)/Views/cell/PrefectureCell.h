//
//  PrefectureCell.h
//  WenDao
//
//  Created by 黄斌 on 2017/4/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrefectureCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *listImage;
@property (strong, nonatomic) IBOutlet UILabel *listTitle;
@property (strong, nonatomic) IBOutlet UILabel *listPrice;
@property (strong, nonatomic) IBOutlet UIButton *selectButton;

- (void)onSelect:(BOOL)isSelect;

@end
