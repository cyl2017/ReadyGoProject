//
//  LKMainTool.m
//  ZhiShiStone
//
//  Created by liuke on 2017/2/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LKMainTool.h"
#import "LKBaseNavController.h"
#import "BMNewFeatureController.h"
#import "BMStartViewController.h"
#import "JScrollView+PageControl+AutoScroll.h"

@implementation LKMainTool
/**
 *
 *  @param UIImage 目标性图片
 *
 *  @return 最终性结果图片信息
 */

// 对图片压缩处理
+(UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize image:(UIImage*)image
{
    UIGraphicsBeginImageContext(targetSize);
    
    [image drawInRect:CGRectMake(0,0,targetSize.width,targetSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}


/**
 *  获取一个字符串 返回字符自适应高度
 *
 *  @param str       目标string
 *  @param theFont   目标标签font 字体大小
 *  @param titleSize 获取目标 标签size
 *
 *  @return   返回的是 自适应标签内容的高度
 */
+(float)getNSStringWidth:(NSString *)str font:(UIFont *)theFont TitleSize:(CGSize)titleSize{
    
    NSDictionary *attributesDict   =@{NSFontAttributeName:theFont};
    CGRect  rect   = [str boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingTruncatesLastVisibleLine attributes:attributesDict context:nil];
    return rect.size.height+10;
}

/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
+ (float) heightForString:(UITextView *)textView andWidth:(float)width
{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

/**
 * 根据View返回VC
 *
 **/
+ (UIViewController*)viewController:(UIView *)view;
{
    for (UIView* next = [view superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
    
}


+ (UIViewController *)chooseRootViewController
{
    if ([self showNewFeature]) {
        BMNewFeatureController *newFeatuer = [[BMNewFeatureController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:newFeatuer];
        return nav;
    }
    BMStartViewController *starVC = [[BMStartViewController alloc]init];
    LKBaseNavController *starVCNav = [[LKBaseNavController alloc] initWithRootViewController:starVC];
    return starVCNav;
    
}

/**
 *  是否需要显示版本新特性页面
 */
+ (BOOL)showNewFeature
{
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //进入导航页三次
    NSInteger times =[userDefaults integerForKey:@"times"];
    times++;
    [userDefaults setInteger:times forKey:@"times"];
    [userDefaults synchronize];
    NSString *previewFeatureVersion = [userDefaults stringForKey:@"previewFeatureVersion"];
    if (!previewFeatureVersion||times<=1) return YES;
    
    NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    if ([previewFeatureVersion isEqualToString:version]) {
        return NO;
    }
    return NO;
    
}
/**
 *  是否显示登录界面
 *
 *  @return：BOOL
 */
+ (BOOL)showLoginPage
{
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return YES;//![[defaults objectForKey:kWhetherLogin] boolValue];
}

+ (void)updateFeatureVersion
{
    NSString *version = [NSBundle mainBundle].infoDictionary[(__bridge NSString *)kCFBundleVersionKey];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:version forKey:@"previewFeatureVersion"];
    [userDefaults synchronize];
}

+ (void)showMessage:(NSString *)msg
{
    dispatch_async(dispatch_get_main_queue(), ^{
       // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        //hud.labelText = @"";
    });
}

+ (void)hideMessage
{
    dispatch_async(dispatch_get_main_queue(), ^{
        //        [MBProgressHUD hideHUDForView:kWindow animated:NO];
       // [MBProgressHUD hideAllHUDsForView:kWindow animated:NO];
    });
}

+ (void)showToast:(NSString *)msg delay:(NSUInteger)delay
{
    dispatch_async(dispatch_get_main_queue(), ^{
        //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        //hud.detailsLabelText = msg;
        //hud.mode = MBProgressHUDModeText;
       // [hud hide:YES afterDelay:delay];
    });
}

+ (void)callWithPhoneNumber:(NSString *)phone target:(id)target
{
    UIWebView *callWebview;
    if (!callWebview) {
        callWebview = [[UIWebView alloc] init];
    }
    
    NSURL *telURL =[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone]];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    //记得添加到view上
    [target addSubview:callWebview];
}

#pragma mark -- 根据格式获取当前日期
+ (NSString *)obtainNowDateWithFormatter:(NSString *)formatterStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    return [formatter stringFromDate:[NSDate date]];
}

#pragma mark -- 将字符串根据格式转换为日期
+ (NSDate *)obtainNowDateWithStr:(NSString *)str formatter:(NSString *)formatterStr
{
    if (!str||[str isEqualToString:@""]) {
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    return [formatter dateFromString:str];
}

#pragma mark -- 将字符串根据格式转换为字符串
+ (NSString *)obtainDateWithDate:(NSString *)date formatter:(NSString *)formatterStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    return [formatter stringFromDate:[formatter dateFromString:date]];
}

#pragma mark -- 获取当前周的周一
+ (NSString *)obtainMonday
{
    unsigned units=NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitYear|NSCalendarUnitWeekday;
    NSCalendar *mycal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now=[NSDate date];
    
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSInteger daycount;
    NSDateComponents *dateComps = [gregorian components:NSCalendarUnitWeekday fromDate:now];
    if ([dateComps weekday] == 1) {//由于美国每周是从周日(周日：1，周一：2)开始，中国每周是从周一开始，需要特别转换
        daycount = 6;
    } else {
        daycount = [dateComps weekday] - 2;
        
    }
    NSDate *weekdaybegin = [now dateByAddingTimeInterval:-daycount*60*60*24];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLocale *mylocal = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [formatter setLocale:mylocal];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    now = weekdaybegin;
    NSDateComponents *comp = [mycal components:units fromDate:now];
    return [NSString stringWithFormat:@"%ld-%02ld-%02ld",(long)[comp year],(long)[comp month],(long)[comp day]];//所要求的周一的日期
}
#pragma mark -- 获取当前是周几
+ (NSString *)obtainWeekDay:(NSDate *)date
{
    NSString *weekday;
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *dateComps = [gregorian components:NSCalendarUnitWeekday fromDate:date];
    switch ([dateComps weekday]) {
        case 1:
            weekday = @"星期日";
            break;
        case 2:
            weekday = @"星期一";
            break;
        case 3:
            weekday = @"星期二";
            break;
        case 4:
            weekday = @"星期三";
            break;
        case 5:
            weekday = @"星期四";
            break;
        case 6:
            weekday = @"星期五";
            break;
        case 7:
            weekday = @"星期六";
            break;
        default:
            weekday = @"星期日";
            break;
    }
    return weekday;
}
#pragma mark -- 手机号码验证
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(NSMutableAttributedString*)attributedStr:(NSString *)titleShowsString integer:(NSInteger)integerLenth startStringPoint:(NSInteger)startPoint attributeColor:(UIColor*)attributeColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:titleShowsString];
    
    [str addAttribute:NSForegroundColorAttributeName value:attributeColor range:NSMakeRange(startPoint,integerLenth)];
    
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:15.0] range:NSMakeRange(startPoint, integerLenth)];
    
    return str;
}

/**
 *  QQ号验证
 *
 *  @param textString QQ号字符串
 *
 *  @return 是否正确
 */
+ (BOOL)validateNumber:(NSString *) textString
{
    NSString* number=@"[1-9][0-9]\{4,11}";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:textString];
}


//判断输入是否为空格
+(BOOL)isEmpty:(NSString *) str {
    
    if (!str) {
        return YES;
    } else {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}

//计算两个日期之间的天数
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate
{
    ////创建日期格式化对象
    //NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[endDate timeIntervalSinceDate:beginDate];
    
    int days=((int)time)/(3600*24);
    //int hours=((int)time)%(3600*24)/3600;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    return days;
}

//判断日期是不是在可输入范围内
+ (BOOL)date:(NSDate*)date
{
    ////创建日期格式化对象
    //NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[date timeIntervalSinceDate:[NSDate date]];
    
    int days=((int)time)/(3600*24);
    //int hours=((int)time)%(3600*24)/3600;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    if (days < 0) {
        return NO;
    }
    else
        return YES;
}

//产生随机数
+(int)getRandomNumber:(int)from to:(int)to

{
    
    return (int)(from + (arc4random() % (to - from + 1)));
}

//发送短信
+(void)sendMessageWithPhoneNum:(NSString *)phone
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", phone]];
    [[UIApplication sharedApplication] openURL:url];
}
/**
 *  验证邮箱正确性
 *
 *  @param email 输入的字符串
 *
 *  @return 返回
 */
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
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
+(UIView *)createAdViewWithFrame:(CGRect)frame delayTime:(float)time target:(id)target imageUrlArray:(NSArray *)urlArray
{
    JScrollView_PageControl_AutoScroll *scrollView = [[JScrollView_PageControl_AutoScroll alloc]initWithFrame:frame];
    
    scrollView.isShowTimerDelay = YES;
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < urlArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView sd_setImageWithURL:urlArray[i] placeholderImage:[UIImage imageNamed:@"home_ad"]];
        [tempArray addObject:imageView];
    }
    
    scrollView.autoScrollDelayTime = time;
    scrollView.delegate = target;
    [scrollView setViewsArray:tempArray];
    [scrollView shouldAutoShow:YES];
    [scrollView.pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:(1)/255.f green:(160)/255.f blue:(211)/255.f alpha:1.f]];
    return (UIView *)scrollView;
}

/**
 *  textView高度
 *
 *  @param value    内容
 *  @param fontSize 字体大小
 *  @param width    宽度
 *
 *  @return 高度
 */
+ (float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    UITextView *detailTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    detailTextView.font = [UIFont systemFontOfSize:fontSize];
    detailTextView.text = value;
    CGSize deSize = [detailTextView sizeThatFits:CGSizeMake(width,CGFLOAT_MAX)];
    return deSize.height;
}

@end
