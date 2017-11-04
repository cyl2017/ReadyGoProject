//
//  LLTextView.m
//  RailWifi
//
//  Created by luan on 15/6/17.
//  Copyright (c) 2015年 cmmobi. All rights reserved.
//

#import "BMTextView.h"

@interface BMTextView ()<UITextViewDelegate>



@end

@implementation BMTextView

- (instancetype)init
{    self=[super init];
    if (self) {
        self.delegate = self;
        self.font = [UIFont systemFontOfSize:14];
        
        self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 4, kScreen_Width-30, 20)];
        self.placeholderLabel.font = [UIFont systemFontOfSize:14];
        self.placeholderLabel.textColor = UIColorFromRGB(0x999999);
        _placeholderLabel.numberOfLines = 0;
        [self addSubview:self.placeholderLabel];
    }
    return self;


}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.font = [UIFont systemFontOfSize:14];
        
        self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 4, kScreen_Width-50, 20)];
    
        self.placeholderLabel.font = [UIFont systemFontOfSize:14];
        self.placeholderLabel.textColor = UIColorFromRGB(0x999999);
        _placeholderLabel.numberOfLines = 0;
        [self addSubview:self.placeholderLabel];
    }
    return self;

}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeholderLabel.text = placeholder;
}

#pragma mark -- UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [self.placeholderLabel setHidden:NO];
    }else{
        [self.placeholderLabel setHidden:YES];
    }
}



@end
