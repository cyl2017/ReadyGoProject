//
//  LKBaseViewController.m
//  ZhiShiStone
//
//  Created by liuke on 2017/2/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LKBaseViewController.h"

@interface LKBaseViewController ()

@end

@implementation LKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BMColor(244, 245, 246);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIBarButtonItem *)createItem:(UIImage *)image title:(NSString *)title action:(SEL)action 
{
    UIBarButtonItem *item;
    if (image) {
        item = [[UIBarButtonItem alloc] initWithImage:image
                                                style:UIBarButtonItemStylePlain
                                               target:self
                                               action:action];
    } else {
        item = [[UIBarButtonItem alloc] initWithTitle:title
                                                style:UIBarButtonItemStylePlain
                                               target:self
                                               action:action];
    }
    return item;
    
}


@end
