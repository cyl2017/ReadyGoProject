//
//  NewAddressViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "NewAddressViewController.h"
#import "GCPlaceholderTextView.h"
#import "RMPickerView.h"
@interface NewAddressViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UIButton *sheng;
@property (weak, nonatomic) IBOutlet UIButton *shi;
@property (weak, nonatomic) IBOutlet UIButton *qu;
@property (weak, nonatomic) IBOutlet UIButton *defultAddress;
@property (weak, nonatomic) IBOutlet GCPlaceholderTextView *textVew;


@end

@implementation NewAddressViewController
- (IBAction)finishBtnClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//tag 11~13
- (IBAction)selectedBtnClick:(UIButton *)sender {
    [self.view endEditing:YES];
    RMPickerView * pickerV = [RMPickerView pickerWithOwnNib];
    weakSelf(self);
    switch (sender.tag-10) {
        case 1:
        {
            pickerV.title.text = @"选择省份";
            pickerV.pickerArray = @[@"功能完善反馈", @"页面优化反馈", @"其他反馈"];
            pickerV.doneBlock =  ^(NSString * str) {
                [weakSelf.sheng setTitle:str forState:UIControlStateNormal];
                
                return YES;
            };
        }
            break;
        case 2:
        {
            pickerV.title.text = @"选择城市";
            pickerV.pickerArray = @[@"功能完善反馈", @"页面优化反馈", @"其他反馈"];
            pickerV.doneBlock =  ^(NSString * str) {
                [weakSelf.shi setTitle:str forState:UIControlStateNormal];
                
                return YES;
            };

        }
            break;
        case 3:
        {
            pickerV.title.text = @"选择区域";
            pickerV.pickerArray = @[@"功能完善反馈", @"页面优化反馈", @"其他反馈"];
            pickerV.doneBlock =  ^(NSString * str) {
                [weakSelf.qu setTitle:str forState:UIControlStateNormal];
                
                return YES;
            };

        }
            break;
        default:
            break;
    }
    

   
    [pickerV show];

}
- (IBAction)setDefultClick:(id)sender {
    _defultAddress.selected = !_defultAddress.selected;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    _textVew.placeholderColor = [UIColor lightTextColor];
    _textVew.font = [UIFont systemFontOfSize:15];
    _textVew.placeholder = @"请填写详细收货地址";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
