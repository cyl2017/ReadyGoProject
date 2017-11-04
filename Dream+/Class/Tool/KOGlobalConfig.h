//
//  KOGlobalConfig.h
//  ElevatorMaintenance
//
//  Created by sandyrilla on 17/5/6.
//  Copyright © 2017年 KingOrient. All rights reserved.
//

#import <Foundation/Foundation.h>

extern float g_ratioF;
extern float g_ratioW;
extern float g_ratioH;
extern float g_screenWidth;
extern float g_screenHeight;

@interface KOGlobalConfig : NSObject

+ (KOGlobalConfig*)sharedConfig;

@end
