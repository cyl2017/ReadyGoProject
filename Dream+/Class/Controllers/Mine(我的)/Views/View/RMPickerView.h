//
//  RMPickerView.h
//  RecoverManagement
//
//  Created by sandyrilla on 2016/10/31.
//  Copyright © 2016年 回收哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMPickerView : UIView
+(instancetype)pickerWithOwnNib;
@property (nonatomic, strong) NSArray* pickerArray;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (nonatomic, copy) BOOL(^doneBlock)(NSString*);
-(void)show;
@end
