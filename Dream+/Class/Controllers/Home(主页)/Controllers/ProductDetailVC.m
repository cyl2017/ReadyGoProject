//
//  ProductDetailVC.m
//  Dream+
//
//  Created by liuke on 2017/10/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ProductDetailVC.h"
#import "MerChantVC.h"
#import "SKTagView.h"
#import "SKTagButton.h"
@interface ProductDetailVC ()<UIWebViewDelegate>{
    UIButton *_selectedButton;
    NSMutableArray *mUrlArray;
    CGFloat _tagHeight;

}
//自选
@property (nonatomic,strong) NSMutableArray *paramsArr;
@property (nonatomic,strong) NSMutableArray *paramsBtnArr;
@property (nonatomic,strong) SKTagView *tagView;
//红条约束
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *letfConstraints;



//respons


@property (strong, nonatomic) IBOutlet UILabel *priceLab;
@property (strong, nonatomic) IBOutlet UILabel *saledCount;
@property (strong, nonatomic) IBOutlet UILabel *returnCredits;
@property (strong, nonatomic) IBOutlet UIButton *paramsSelected;
@property (strong, nonatomic) IBOutlet UIButton *enterMerchant;

@property (strong, nonatomic) IBOutlet UIView *merchantIco;


@property (nonatomic, strong) UIWebView *callWebView;

//规格视图
@property (nonatomic, strong) UIView *paramsView;
@property (strong, nonatomic) IBOutlet UIImageView *productIco;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIStackView *stackView;
@property (strong, nonatomic) IBOutlet UILabel *countNum;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stackViewConstraint;

@end

@implementation ProductDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.paramsBtnArr =@[].mutableCopy;
    self.paramsArr = [NSMutableArray arrayWithArray:@[@"s蓝色",@"s红色",@"m加大号",@"xxx大块头专用"]];
    _paramsView =  [[[NSBundle mainBundle]loadNibNamed:@"ProductParamsView" owner:self options:nil]lastObject];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectedParams:(UIButton *)sender {
    //规格选择 0
    [self initCoverWindow];
    self.tagView = [[SKTagView alloc] init];
    // 整个tagView对应其SuperView的上左下右距离
    self.tagView.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    // 上下行之间的距离
    self.tagView.lineSpacing = 10;
    // item之间的距离
     self.tagView.interitemSpacing = 15;
    // 最大宽度
     self.tagView.preferredMaxLayoutWidth = kScreen_Width - 20;
     self.tagView.regularHeight = 30;
    // 开始加载
    [self.paramsArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 初始化标签
        SKTag *tag = [[SKTag alloc] initWithText:self.paramsArr[idx]];
        tag.index = idx;
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(3, 15, 3, 15);
        // 弧度
        tag.cornerRadius = 3.0f;
        // 字体
        tag.font = [UIFont boldSystemFontOfSize:12];
        // 边框宽度
        tag.borderWidth = 0;
        // 背景
        
        if (idx==0) {
            tag.bgColor = [UIColor redColor];
            tag.textColor = [UIColor whiteColor];
        }else{
            tag.bgColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
            tag.textColor = [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1];
            
        }
        // 边框颜色
        tag.borderColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1];
        
        // 是否可点击
        tag.enable = YES;
        // 加入到tagView
        [self.tagView addTag:tag];
    }];
    // 点击事件回调
    
    weakSelf(self);
    self.tagView.didTapTagAtIndex = ^(NSUInteger inx){
       
        [weakSelf.tagView.btns enumerateObjectsUsingBlock:^(SKTagButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
            if (inx==idx) {
                btn.backgroundColor = [UIColor redColor];
                [btn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
            }else{
                
                btn.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
                [btn setTitleColor: [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1] forState: UIControlStateNormal];
            }
        }];
       
        
    };
    
    // 获取刚才加入所有tag之后的内在高度
    _tagHeight = self.tagView.intrinsicContentSize.height;
    self.stackViewConstraint.constant = _tagHeight;
    self.tagView.frame = CGRectMake(0, 0, kScreen_Width-20, _tagHeight);
    [self.tagView layoutSubviews];
    [self.stackView addSubview:self.tagView];
    [self.cover addSubview:_paramsView];
    _paramsView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 241+_tagHeight);
    [UIView animateWithDuration:0.25 animations:^{
     _paramsView.frame = CGRectMake(0, kScreenHeight-(241+_tagHeight)-64, kScreenWidth, 241+_tagHeight);
    }];
    
}


- (IBAction)enterMercahnt:(UIButton *)sender {
    //进入商家 1
    MerChantVC *merchantVC = [MerChantVC new];
    merchantVC.title = @"商家名称";
    [self.navigationController pushViewController:merchantVC animated:YES];
    
}


- (IBAction)paramsOrphotogrophDetails:(UIButton *)sender {
    // 图文详情 2 产品参数 3
    self.letfConstraints.constant = kScreen_Width*(sender.tag-2)/2;
    
    
}


- (IBAction)collectionArraryForClickOnBottom:(UIButton *)sender {
    
    // 客服4 收藏5 加入购物车6 立即购买7
    
}




-(void) initCoverWindow{
    // 2.显示遮盖（蒙板）
    if (self.cover == nil) {
        self.cover = [BMCover coverWithTarget:self action:@selector(coverClick)];
    }
    self.cover.frame = CGRectMake(0,64, kScreenWidth, kScreenHeight);
    
    [kWindow addSubview:self.cover];
    
    [self.cover reset];
  
    [UIView animateWithDuration:0.25 animations:^{
        [self.cover dim];
    }];
}

#pragma mark 监听点击遮盖
- (void)coverClick
{
    // 1.移除遮盖
    [UIView animateWithDuration:0.25 animations:^{
        _paramsView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 241+_tagHeight);
    }];
    [UIView animateWithDuration:0.25 animations:^{
        [self.cover reset];
    } completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
    }];
    
    
}

//数量加减
- (IBAction)plusOrReduce:(UIButton *)sender {
    //110 111加
    if (sender.tag==110) {
        if ([self.countNum.text integerValue]<=1) {
            
        }else{
            
            NSInteger num = [self.countNum.text integerValue];
            num--;
            self.countNum.text = [NSString stringWithFormat:@"%ld",num];
        }
    }else{
        
        NSInteger num = [self.countNum.text integerValue];
        num++;
        self.countNum.text = [NSString stringWithFormat:@"%ld",num];
        
    }
    
}
- (IBAction)sure:(UIButton *)sender {
    
    //确定
    [self coverClick];
}
@end
