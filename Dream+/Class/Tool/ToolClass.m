//
//  ToolClass.m
//  MHStaff
//
//  
//  Copyright © 2016年 BlueMobi. All rights reserved.
//

#import "ToolClass.h"

#import "UserModel.h"

#import <SVProgressHUD/SVProgressHUD.h>
//MD5
#import <CommonCrypto/CommonDigest.h>
@implementation ToolClass

/**
 * 把用户Dictionary存入NSUserDefaults
 * 标示 @“userInfo”
 **/
+ (void)saveUserInfo:(UserModel *)user {
    
    NSLog(@"保存用户信息:\r%@",user);
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *udObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    //   [user setObject:@"" forKey:@"addressId"];
    [userDefaults setObject:udObject forKey:@"userInfo"];
    [userDefaults synchronize];
}

/**
 * 根据标示获取用户的Dictionary
 *
 **/
+ (UserModel *)userInfo {
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    if ([userDefaultes objectForKey:@"userInfo"]) {
        NSData *dObject = [userDefaultes objectForKey:@"userInfo"];
        UserModel  *model= [NSKeyedUnarchiver unarchiveObjectWithData:dObject];
        return model;
    }else{
        return nil;
    }
}

/**
 * 清除userInfo
 **/
+ (void)clearUserInfo {

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

/*
 手机号码验证
 */
+ (BOOL) validateMobile:(NSString *)mobile
{
    
    NSString *mobileRegex = @"^(1([0-9][0-9]))\\d{8}$";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    BOOL isMatch = [mobileTest evaluateWithObject:mobile];
    return isMatch;
    
}
//身份证验证
+ (BOOL)ValidateIDCard:(NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = YES;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}


+(void)showAlertInView:(UIView*)superView withText:(NSString*)str{
    [self showAlertInView:superView withText:str withYOffset:0.f];
}

+(void)showAlertInView:(UIView *)superView withText:(NSString *)str withYOffset:(CGFloat)YOffset{

    [SVProgressHUD showInfoWithStatus:str];

}
//设置tableview多余的线
+(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}
//行间距
+ (NSMutableAttributedString *)getAttrString:(NSString *)string
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6];//调整行间距
    paragraphStyle.alignment = NSTextAlignmentLeft;//对齐方式
    paragraphStyle.firstLineHeadIndent = 0;//首行头缩进
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return  attributedString;
}

//MD5 32位小写加密
+ (NSString *)md5:(NSString *)str {
//    const char *cStr = [str UTF8String];
//    unsigned char result[16];
//    CC_MD5( cStr, (int)strlen(cStr), result );
//    return [NSString stringWithFormat:
//            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//            result[0],result[1],result[2],result[3],
//            result[4],result[5],result[6],result[7],
//            result[8],result[9],result[10],result[11],
//            result[12],result[13],result[14],result[15]];
    
    if(str == nil) {
        return @"";
    }
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],
            result[4],result[5],result[6],result[7],
            result[8],result[9],result[10],result[11],
            result[12],result[13],result[14],result[15]];
}

+ (UIColor*)colorWithHexValue:(long int)theHexValue {
    
    return [UIColor colorWithRed:((float)((theHexValue & 0xFF0000) >> 16))/255.0 green:((float)((theHexValue & 0xFF00) >> 8))/255.0 blue:((float)(theHexValue & 0xFF))/255.0 alpha:1.0];
    
}

// 弹出登录页面
+ (void)presentLoginVCOnVC:(UIViewController*)VC {

   

}
// 弹出注册页面
+ (void)presentRegisterVCOnVC:(UIViewController*)VC{
   
}

+ (NSDate*)dateWithString:(NSString*)string {

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:string];

    return date;

}

+ (NSDate*)dateWithLocalString:(NSString*)string {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [dateFormatter dateFromString:string];
    
    return date;
    
}

+ (NSString*)stringWithDate:(NSDate*)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *str = [dateFormatter stringFromDate:date];
    
    return str;
    
}

+ (NSString*)stringWithServerDateString:(NSString*)serverDateString {

    return [ToolClass stringWithDate:[ToolClass dateWithString:serverDateString]];

}

+ (NSInteger)minuteValueBetweenStartDate:(NSDate*)startDate endDate:(NSDate*)endDate {

    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitMinute;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:startDate toDate:endDate options:0];
    
    return cmps.minute;

}


//输入框中只能输入数字和小数点，且小数点只能输入一位，参数number 可以设置小数的位数，该函数在-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string调用；

+ (BOOL)isValidAboutInputText:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string decimalNumber:(NSInteger)number{
    
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSScanner      *scanner    = [NSScanner scannerWithString:string];
    NSCharacterSet *numbers;
    NSRange         pointRange = [textField.text rangeOfString:@"."];
    if ( (pointRange.length > 0) && (pointRange.location < range.location  || pointRange.location > range.location + range.length) ){
        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    }else{
        numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    }
    if ( [textField.text isEqualToString:@""] && [string isEqualToString:@"."] ){
        return NO;
    }
    short remain = number; //保留 number位小数
    NSString *tempStr = [textField.text stringByAppendingString:string];
    NSUInteger strlen = [tempStr length];
    if(pointRange.length > 0 && pointRange.location > 0){ //判断输入框内是否含有“.”。
        if([string isEqualToString:@"."]){ //当输入框内已经含有“.”时，如果再输入“.”则被视为无效。
            return NO;
        }
        if(strlen > 0 && (strlen - pointRange.location) > remain+1){ //当输入框内已经含有“.”，当字符串长度减去小数点前面的字符串长度大于需要要保留的小数点位数，则视当次输入无效。
            return NO;
        }
    }
    NSRange zeroRange = [textField.text rangeOfString:@"0"];
    if(zeroRange.length == 1 && zeroRange.location == 0){ //判断输入框第一个字符是否为“0”
        if(![string isEqualToString:@"0"] && ![string isEqualToString:@"."] && [textField.text length] == 1){ //当输入框只有一个字符并且字符为“0”时，再输入不为“0”或者“.”的字符时，则将此输入替换输入框的这唯一字符。
            textField.text = string;
            return NO;
        }else{
            if(pointRange.length == 0 && pointRange.location > 0){ //当输入框第一个字符为“0”时，并且没有“.”字符时，如果当此输入的字符为“0”，则视当此输入无效。
                if([string isEqualToString:@"0"]){
                    return NO;
                }
            }
        }
    }
    NSString *buffer;
    if ( ![scanner scanCharactersFromSet:numbers intoString:&buffer] && ([string length] != 0) ){
        return NO;
    }else if([toBeString length]>9){
        return NO;
    }else{
        return YES;
    }
}

+ (NSString*)stringWithTimeStamp:(NSString*)timeStamp {

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    fmt.dateFormat = @"yyyy-MM-dd HH:mm";
    
    // 时间戳 转换
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[timeStamp integerValue]];
    
    return [fmt stringFromDate:date];
    
}

+ (NSInteger)hourValueBetweenNowToEndTime:(NSString*)endTime {

    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitHour;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:[NSDate date] toDate:[self dateWithString:endTime] options:0];
    
    return cmps.hour;

}

+(void)alertMess:(NSString *)str
{
    UIAlertView *view=[[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [view show];
}

//计算某一天距离今天多少天，多少小时，多少分钟
+ (NSString *)intervalSinceNow: (NSString *) theDate
{
    NSString *timeString=@"";
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromdate=[format dateFromString:theDate];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    
    //获取当前时间
    NSDate *adate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: adate];
    NSDate *localeDate = [adate  dateByAddingTimeInterval: interval];
    
    double intervalTime = [fromDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    
    if (intervalTime < 0) {
        return @"已超时";
    }
    
    long lTime = labs((long)intervalTime);
    
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;
//    NSInteger yy = dd * 365;
    
    // 剩余的
    NSInteger day = lTime / dd;// 天
    NSInteger hour = (lTime - day * dd) / hh;// 时
    NSInteger minute = (lTime - day * dd - hour * hh) / mi;// 分
    NSInteger second = (lTime - day * dd - hour * hh - minute * mi) / ss;// 秒
    
    NSLog(@"%ld天%ld时%ld分%ld秒",(long)day,(long)hour,(long)minute,(long)second);
    timeString = [NSString stringWithFormat:@"%ld天%ld时%ld分",(long)day,(long)hour,(long)minute];
    
    
    if (day > 0) {
        timeString = [NSString stringWithFormat:@"%ld天%ld时%ld分",(long)day,(long)hour,(long)minute];
    }else if (day == 0&&hour > 0){
        timeString = [NSString stringWithFormat:@"%ld时%ld分",(long)hour,(long)minute];
    }else if (day == 0 && hour ==0 && minute >0){
        timeString = [NSString stringWithFormat:@"%ld分",(long)minute];
    }

    return timeString;
}
//分数全部格式化成2位小数
+ (NSString *)score2DecimalPlaces:(NSString *)score{
    float scoreFl = [score floatValue];
    if (scoreFl == 0) {
        return @"0";
    }else{
        return [NSString stringWithFormat:@"%.2f",scoreFl];
    }
}


/**
 * 根据View返回VC
 *
 **/
+ (UIViewController*)viewController:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
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

//计算某一天距离今天多少天，多少小时，多少分钟
+ (NSInteger )integerIntervalSinceNow: (NSString *) theDate
{
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromdate=[format dateFromString:theDate];
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    
    //获取当前时间
    NSDate *adate = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: adate];
    NSDate *localeDate = [adate  dateByAddingTimeInterval: interval];
    
    double intervalTime = [fromDate timeIntervalSinceReferenceDate] - [localeDate timeIntervalSinceReferenceDate];
    
  
    return intervalTime;
}
//
+(UIViewController *)loadViewControllerWithStoryboardName:(NSString *)Identifier
{
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:Identifier];
}

+(UIView *)viewFromNibName:(NSString *)xibName andClass:(Class)nibClass target:(id)target
{
    NSArray *arrayOfViews = [[NSBundle mainBundle]loadNibNamed:xibName owner:target options:nil];
    
    // 如果路径不存在，return nil
    if (arrayOfViews.count < 1) {
        return nil;
    }
    //如果xib中view不属于UICollectionViewCell类，return nil
    if (![[arrayOfViews firstObject] isKindOfClass:nibClass]) {
        return nil;
    }
    return [arrayOfViews firstObject];
}
@end
