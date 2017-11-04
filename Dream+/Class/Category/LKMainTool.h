//
//  LKMainTool.h
//  ZhiShiStone
//
//  Created by liuke on 2017/2/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKMainTool : NSObject
//给你一个目标图片，在把他转为 你想要的尺寸信息
+(UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize image:(UIImage*)image;

// 获取一个字符串 返回字符自适应高度
+(float)getNSStringWidth:(NSString *)str font:(UIFont *)theFont TitleSize:(CGSize)titleSize;

//获取指定宽度width的字符串在UITextView上的高度
+ (float) heightForString:(UITextView *)textView andWidth:(float)width;
//在一个字符串里面设置不同的字体颜色
+(NSMutableAttributedString*)attributedStr:(NSString *)titleShowsString integer:(NSInteger)integerLenth startStringPoint:(NSInteger)startPoint attributeColor:(UIColor*)attributeColor;
/**
 * 根据View返回VC
 *
 **/
+ (UIViewController*)viewController:(UIView *)view;

/**
 *  选择程序启动时候的根控制器
 */
+ (UIViewController *)chooseRootViewController;

+ (void)updateFeatureVersion;

/**
 *  屏幕上显示一个消息，需要调用hideMessage隐藏。
 *
 *  @param msg 显示的内容
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  隐藏屏幕上的消息
 */
+ (void)hideMessage;

/**
 *  显示一个信息在指定时间后删除
 *
 *  @param msg   消息内容
 *  @param delay 显示的时间
 */
+ (void)showToast:(NSString *)msg delay:(NSUInteger)delay;

/**
 *  拨打电话
 *
 *  @param phone 电话号码
 */
/**
 *  拨打电话
 *
 *  @param phone  电话号码
 *  @param target 目标view
 */
+ (void)callWithPhoneNumber:(NSString *)phone target:(id)target;

/**
 *  根据格式获取当前日期
 *
 *  @param formatterStr 日期格式
 *
 *  @return 当前日期对应格式的字符串
 */
+ (NSString *)obtainNowDateWithFormatter:(NSString *)formatterStr;
/**
 *  将字符串根据格式转换为日期
 *
 *  @param str          要转换的时间
 *  @param formatterStr 日期格式
 *
 *  @return 转换后的日期
 */
+ (NSDate *)obtainNowDateWithStr:(NSString *)str formatter:(NSString *)formatterStr;
/**
 *  将时间转换成字符串
 *
 *  @param date         时间
 *  @param formatterStr 时间格式
 *
 *  @return 转换后的字符串
 */
+ (NSString *)obtainDateWithDate:(NSString *)date formatter:(NSString *)formatterStr;

/**
 *  获取当前周的周一
 *
 *  @return 当前周周一日期的字符串,格式为yyyy-MM-dd
 */
+ (NSString *)obtainMonday;
/**
 *  获取当前周几
 *
 *  @param date 时间
 *
 *  @return 周几的字符串
 */
+ (NSString *)obtainWeekDay:(NSDate *)date;
/**
 *  手机号码验证
 *
 *  @param mobileNum 手机号码字符串
 *
 *  @return 是否正确
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 *  QQ号验证
 *
 *  @param textString QQ号字符串
 *
 *  @return 是否正确
 */
+ (BOOL)validateNumber:(NSString *) textString;

/**
 *  判断输入是否为空
 *
 *  @param str 输入字符串
 *
 *  @return 是否正确
 */
+(BOOL)isEmpty:(NSString *) str;

/**
 *  计算两个日期之间的天数
 *
 *
 *
 *  @return 两个日期之间的天数
 */
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate;

/**
 *  判断日期是不是在可输入范围内
 *
 *  
 *
 *  @return 是否在可输入日期范围内
 */
+ (BOOL)date:(NSDate*)date;
/**
 *  获得随机数
 *
 *  @param from 最小
 *  @param to   最大
 *
 *  @return 随机数
 */
+(int)getRandomNumber:(int)from to:(int)to;
/**
 *  判断是否是邮箱格式字符串
 *
 *  @param email 字符串
 *
 *  @return 是否是邮箱格式
 */
+ (BOOL)validateEmail:(NSString *)email;
/**
 *  添加轮播图
 *
 *  @param frame
 *  @param time 每张图片切换时间
 *  @param target 代理
 *  @imageUrlArray urlArray URL数组
 *
 *  @return
 */
+(UIView *)createAdViewWithFrame:(CGRect)frame delayTime:(float)time target:(id)target imageUrlArray:(NSArray *)urlArray;
/**
 *  textView高度
 *
 *  @param value    内容
 *  @param fontSize 字体大小
 *  @param width    宽度
 *
 *  @return 高度
 */
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;

@end
