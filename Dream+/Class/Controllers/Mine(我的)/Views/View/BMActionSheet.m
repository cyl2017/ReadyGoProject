//
//  BMActionSheet.m
//  Alarm
//
//  Created by 黄斌 on 2016/12/2.
//  Copyright © 2016年 ronaldwong. All rights reserved.
//

#import "BMActionSheet.h"

@interface BMActionSheet()

@property (nonatomic,strong) UIView *backgroundView;

@property (nonatomic,strong) UIButton *cancelButton;

@property (nonatomic,strong) UIView *someButtonView;
@property (nonatomic,strong) NSMutableArray <UIButton *>*buttons;

@end

@implementation BMActionSheet

- (NSMutableArray *)buttons {
    if(!_buttons) {
        self.buttons = @[].mutableCopy;
    }
    return _buttons;
}

- (void)onClick:(onClickBlock)block {
    self.block = block;
}

- (instancetype)initWithArray:(NSArray <NSString *>*)titles
{
    self = [super init];
    if (self) {
        
        self.color = [UIColor blackColor];
        
        self.backgroundView = [[UIView alloc] init];
        self.backgroundView.backgroundColor = [UIColor blackColor];
        self.backgroundView.alpha = 0.3;
        [self addSubview:self.backgroundView];
        
        UIFont *fontSize = [UIFont systemFontOfSize:16];
        UIColor *backgroundColor = [UIColor whiteColor];
        UIColor *fontColor = [UIColor blackColor];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        self.cancelButton.backgroundColor = backgroundColor;
        self.cancelButton.layer.cornerRadius = 5;
        self.cancelButton.layer.masksToBounds = YES;
        self.cancelButton.titleLabel.font = fontSize;
        [self.cancelButton setTitleColor:fontColor forState:UIControlStateNormal];
        [self.cancelButton addTarget:self action:@selector(cancenButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
        self.someButtonView = [[UIView alloc] init];
        self.someButtonView.backgroundColor = [UIColor lightGrayColor];
        self.someButtonView.layer.cornerRadius = 5;
        self.someButtonView.layer.masksToBounds = YES;
        [self addSubview:self.someButtonView];

        for (NSInteger i=0; i<titles.count; ++i) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:titles[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = backgroundColor;
            button.titleLabel.font = fontSize;
            [button setTitleColor:fontColor forState:UIControlStateNormal];
            [self.someButtonView addSubview:button];
    
            [self.buttons addObject:button];
        }
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    CGFloat buttonW = self.frame.size.width-20;
    CGFloat buttonH = 44;
    self.cancelButton.frame = CGRectMake(10, self.frame.size.height+100-50, buttonW, buttonH);
    NSInteger cnt = _buttons.count;
    CGFloat startY = self.frame.size.height+100 - (cnt*buttonH+(cnt-1))-10-buttonH;
    self.someButtonView.frame = CGRectMake(10, startY, buttonW, (cnt*buttonH+(cnt-1)));
    for (NSInteger i=0; i<cnt; ++i) {
        UIButton *button = _buttons[i];
        button.frame = CGRectMake(0, i*(buttonH+1), buttonW, buttonH);
        if (i == _number) {
            [button setTitleColor:self.color forState:UIControlStateNormal];
        }
    }
}

- (void)cancenButtonOnClick {
    [UIView animateWithDuration:0.1 animations:^{
        CGFloat buttonW = self.frame.size.width-20;
        CGFloat buttonH = 44;
        self.cancelButton.frame = CGRectMake(10, self.frame.size.height+200-50, buttonW, buttonH);
        NSInteger cnt = _buttons.count;
        CGFloat startY = self.frame.size.height+200 - (cnt*buttonH+(cnt-1))-10-buttonH;
        self.someButtonView.frame = CGRectMake(10, startY, buttonW, (cnt*buttonH+(cnt-1)));
        for (NSInteger i=0; i<cnt; ++i) {
            UIButton *button = _buttons[i];
            button.frame = CGRectMake(0, i*(buttonH+1), buttonW, buttonH);
            if (i == _number) {
                [button setTitleColor:self.color forState:UIControlStateNormal];
            }
        }
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication].keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[self class]]) {
                [obj removeFromSuperview];
                obj = nil;
            }
        }];
        self.block(nil);
    }];
}

- (void)buttonOnClick:(UIButton *)button {
    self.block(button);
    
    [self cancenButtonOnClick];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [UIView animateWithDuration:0.3 animations:^{
        CGFloat buttonW =  self.frame.size.width-20;
        CGFloat buttonH = 44;
        self.cancelButton.frame = CGRectMake(10, self.frame.size.height-50, buttonW, buttonH);
        NSInteger cnt = _buttons.count;
        CGFloat startY = self.frame.size.height - (cnt*buttonH+(cnt-1))-10-buttonH;
        self.someButtonView.frame = CGRectMake(10, startY, buttonW, (cnt*buttonH+(cnt-1)));
        for (NSInteger i=0; i<cnt; ++i) {
            UIButton *button = _buttons[i];
            button.frame = CGRectMake(0, i*(buttonH+1), buttonW, buttonH);
            if (i == _number) {
                [button setTitleColor:self.color forState:UIControlStateNormal];
            }
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
