//
//  ToolClass.h
//  MHStaff
//
//  
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class UserModel;

@interface ToolClass : NSObject


/**
 * 把用户Dictionary存入NSUserDefaults
 * 标示 @“userInfo”
 **/
+ (void)saveUserInfo:(UserModel *)user;
/**
 * 根据标示获取用户的Dictionary
 *
 **/
+ (UserModel *) userInfo;

/**
 * 清除userInfo
 *
 **/
+ (void)clearUserInfo;

/*
 手机号码验证
 */
+ (BOOL) validateMobile:(NSString *)mobile;
//身份证验证
+ (BOOL)ValidateIDCard:(NSString *)identityCard;
//提示框
+(void)showAlertInView:(UIView*)superView withText:(NSString*)str;

+(void)showAlertInView:(UIView*)superView withText:(NSString*)str withYOffset:(CGFloat)YOffset;

//设置tableview多余的线
+(void)setExtraCellLineHidden: (UITableView *)tableView;

//行间距
+ (NSMutableAttributedString *)getAttrString:(NSString *)string;

//MD5 32位小写加密
+ (NSString *)md5:(NSString *)str;

// 16进制 颜色
+ (UIColor*)colorWithHexValue:(long int)theHexValue;

// 弹出登录页面
+ (void)presentLoginVCOnVC:(UIViewController*)VC;

// 弹出注册页面
+ (void)presentRegisterVCOnVC:(UIViewController*)VC;

//输入框中只能输入数字和小数点，且小数点只能输入一位，参数number 可以设置小数的位数
+ (BOOL)isValidAboutInputText:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string decimalNumber:(NSInteger)number;


+ (NSDate*)dateWithString:(NSString*)string;

+ (NSDate*)dateWithLocalString:(NSString*)string;

+ (NSString*)stringWithDate:(NSDate*)date;


+ (NSInteger)minuteValueBetweenStartDate:(NSDate*)startDate endDate:(NSDate*)endDate;

+ (NSString*)stringWithTimeStamp:(NSString*)timeStamp;

+ (NSInteger)hourValueBetweenNowToEndTime:(NSString*)endTime;

//最普通的弹出框
+(void)alertMess:(NSString *)str;

//计算某一天距离今天多少天，多少小时，多少分钟
+ (NSString *)intervalSinceNow: (NSString *) theDate;

//把从服务器返回的时间转换到分
+ (NSString*)stringWithServerDateString:(NSString*)serverDateString;
//分数全部格式化成2位小数
+ (NSString *)score2DecimalPlaces:(NSString *)score;

//获取view的vc
+ (UIViewController*)viewController:(UIView *)view ;
/**
 *  拨打电话
 *
 *  @param phone  电话号码
 *  @param target 目标view
 */
+ (void)callWithPhoneNumber:(NSString *)phone target:(id)target;
//
+ (NSInteger )integerIntervalSinceNow: (NSString *) theDate;
/**
 *  load VC from storyBoard
 *
 *  @param Identifier  Identifier
 *
 *  @return 加载viewController
 */
+(UIViewController *)loadViewControllerWithStoryboardName:(NSString *)Identifier;
/**
 *  load view from xib
 *
 *  @param xibName  xib 名称
 *  @param nibClass xib 类名
 *  @param target file owner
 *
 *  @return 加载进内存的 view
 */
+(UIView *)viewFromNibName:(NSString *)xibName andClass:(Class)nibClass target:(id)target;
@end
