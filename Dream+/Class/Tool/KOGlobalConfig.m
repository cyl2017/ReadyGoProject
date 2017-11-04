//
//  KOGlobalConfig.m
//  ElevatorMaintenance
//
//  Created by sandyrilla on 17/5/6.
//  Copyright © 2017年 KingOrient. All rights reserved.
//

#import "KOGlobalConfig.h"

float g_ratioF;
float g_ratioW;
float g_ratioH;
float g_screenWidth;
float g_screenHeight;

@implementation KOGlobalConfig

+ (KOGlobalConfig*)sharedConfig
{
    static KOGlobalConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[KOGlobalConfig alloc] init];
    });
    return config;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        srand ( (unsigned) time (NULL) );
        g_screenHeight = [UIScreen mainScreen].bounds.size.height;
        g_screenWidth  = [UIScreen mainScreen].bounds.size.width;
        
        g_ratioW = ((CGFloat)g_screenWidth  / (CGFloat)335.0);
        g_ratioH = ((CGFloat)g_screenHeight / (CGFloat)667.0);
        
        g_ratioF = MIN(g_ratioW, g_ratioH);
    }
    return self;
}

@end
