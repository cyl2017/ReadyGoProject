//
//  BMSearchBar.m
//  恒信门窗
//
//  Created by 苏荷 on 16/3/27.
//  Copyright © 2016年 BM. All rights reserved.
//

#import "BMSearchBar.h"

@implementation BMSearchBar
//自定义SearchBar
-(void)layoutSubviews
{
    [super layoutSubviews];
    //通过遍历self.subviews找到searchField
    UITextField * searchField;
    NSUInteger numViews = [self.subviews count];
    for (int i = 0; i < numViews; i++) {
        if ([[self.subviews objectAtIndex:i]isKindOfClass:[UITextField class]]) {
            searchField = [self.subviews objectAtIndex:i];
        }
    }
    //如果上述方法找不到searchField，那就试试下面的方法
    
    if (searchField== nil) {
        NSArray * arraySub = [self subviews];
        UIView * viewSelf = [arraySub objectAtIndex:0];
        NSArray * arrayView = [viewSelf subviews];
        for (int i= 0; i < arrayView.count; i++) {
            if ([[arrayView objectAtIndex:i]isKindOfClass:[UITextField class]]) {
                searchField = [arrayView objectAtIndex:i];
            }
        }
    }
    
    if(!(searchField==nil)) {
        //设置颜色
        searchField.textColor=[UIColor darkGrayColor];
        searchField.font = Kfont(13);
        //设置背景颜色
        [searchField setBackground:[UIImage imageNamed:@"Home_searchBar"]];
        
        [searchField setBorderStyle:UITextBorderStyleNone];
        //设置placeholder的颜色
        [searchField setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
        //设置searchField上的照片
        UIImage * image = [UIImage imageNamed:@"Home_Search"];
        UIImageView * iView = [[UIImageView alloc]initWithImage:image];
        iView.frame = CGRectMake(0,10,13,13);
        searchField.leftViewMode=UITextFieldViewModeAlways;
        searchField.leftView = iView;
        
     
        
    }
    
    //先刷透明样式，再进行内部构造美工
    self.searchBarStyle = UISearchBarStyleMinimal;
    searchField.frame=CGRectMake(0, 0, kScreenWidth*0.7, 30);
    searchField.backgroundColor = [UIColor clearColor];
    searchField.layer.cornerRadius = 3.0f;
    searchField.layer.masksToBounds = YES;
   [searchField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
}


@end
