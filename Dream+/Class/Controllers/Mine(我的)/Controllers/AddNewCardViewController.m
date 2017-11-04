//
//  AddNewCardViewController.m
//  Dream+
//
//  Created by macbook on 2017/10/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddNewCardViewController.h"

@interface AddNewCardViewController ()
@property (weak, nonatomic) IBOutlet UIButton *addCardBtn;

@end

@implementation AddNewCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addCardBtn.layer.cornerRadius = 20;
    _addCardBtn.clipsToBounds = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
