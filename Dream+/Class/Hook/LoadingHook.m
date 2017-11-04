//
//  LoadingHook.m
//  MoonLight
//
//  Created by 陈宇 on 16/3/10.
//  Copyright © 2016年 陈宇. All rights reserved.
//

#import "LoadingHook.h"

@implementation LoadingHook

- (void)doBefore:(BMRequest *)requset
{
    //[SVProgressHUD show];
}

- (void)doAfterEnd:(BMResponse *)response error:(NSError *)error
{
    [SVProgressHUD popActivity];
}

@end
