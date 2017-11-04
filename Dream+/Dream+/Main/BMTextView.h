//
//  LLTextView.h
//  RailWifi
//
//  Created by luan on 15/6/17.
//  Copyright (c) 2015年 cmmobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMTextView : UITextView
@property (nonatomic,strong) UILabel *placeholderLabel;
- (void)setPlaceholder:(NSString *)placeholder;

@end
