//
//  HomeHeaderReusableView.h
//  Dream+
//
//  Created by liuke on 2017/10/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeHeaderReusableView : UICollectionReusableView
@property (strong, nonatomic) IBOutlet SDCycleScrollView *adScrollerView;
@property (strong, nonatomic) IBOutlet UIButton *nProduct;
@property (strong, nonatomic) IBOutlet UIButton *recommentPro;
@property (strong, nonatomic) IBOutlet UIButton *creditsExcahnge;
@property (strong, nonatomic) IBOutlet UIButton *allProduct;

@end
