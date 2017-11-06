//
//  ToolKit.m
//  Pods
//
//  Created by LeungL on 16/6/2.
//
//

#import "ToolKit.h"


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

@implementation ToolKit

@end

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#pragma mark - - Mutable set & add safely

@implementation NSMutableDictionary (SafeSet)

- (void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (aKey) {
        if (!anObject) {
            [self removeObjectForKey:aKey];
        }
        else {
            [self setObject:anObject forKey:aKey];
        }
    }
}

@end

@implementation NSMutableArray (SafeAdd)

- (void)safe_addObject:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    }
}

@end

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#pragma mark - - NSDictionary get object
// - - -
id dicGetObject(NSDictionary * dic, id aKey, Class aClass) {
    id result = [dic objectForKey:aKey];
    if (result && [result isKindOfClass:aClass]) {
        return result;
    }
    return nil;
}

// - - -
NSDictionary * dicGetDic(NSDictionary *dic, id aKey) {
    return (NSDictionary *)dicGetObject(dic, aKey, [NSDictionary class]);
}

NSArray * dicGetArray(NSDictionary *dic, id aKey) {
    return (NSArray *)dicGetObject(dic, aKey, [NSArray class]);
}

NSArray * dicGetArraySafe(NSDictionary *dic, id aKey) {
    if ([dic objectForKey:aKey] && ![[dic objectForKey:aKey] isKindOfClass:[NSArray class]])
    {
        return [NSArray arrayWithObject:[dic objectForKey:aKey]];
    }
    return dicGetArray(dic, aKey);
}

// - - -
NSString * dicGetString(NSDictionary *dic, id aKey) {
    if (dic == nil || ![dic isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id result = [dic objectForKey:aKey];
    if (result && [result isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",result];
    } else if (result && [result isKindOfClass:[NSString class]]) {
        return (NSString *)result;
    }
    return nil;
}

NSString * dicGetStringSafe(NSDictionary *dic, id aKey) {
    if (dicGetString(dic, aKey) && dicGetString(dic, aKey).length > 0) {
        return dicGetString(dic, aKey);
    }
    return @"";
}

// - - -
int dicGetInt(NSDictionary *dic, id aKey, int nDefault) {
    if (dic) {
        id result = [dic objectForKey:aKey];
        if (result && [result isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)result intValue];
        }
        else if (result && [result isKindOfClass:[NSString class]]) {
            return [(NSString *)result intValue];
        }
    }
    return nDefault;
}

float dicGetFloat(NSDictionary *dic, id aKey, float fDefault) {
    if (dic) {
        id result = [dic objectForKey:aKey];
        if (result && [result isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)result floatValue];
        }
        else if (result && [result isKindOfClass:[NSString class]]) {
            return [(NSString *)result floatValue];
        }
    }
    return fDefault;
}

BOOL dicGetBool(NSDictionary *dic, id aKey, BOOL bDefault) {
    if (dic) {
        id result = [dic objectForKey:aKey];
        if (result && [result isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)result boolValue];
        }
        else if (result && [result isKindOfClass:[NSString class]]) {
            return [(NSString *)result boolValue];
        }
    }
    return bDefault;
}

#pragma mark - - NSArray get object
// - - - -
id arrGetObject(NSArray *arr, NSUInteger index, Class aClass) {
    NSDictionary *result = nil;
    if (index < arr.count) {
        result = [arr objectAtIndex:index];
        if (result && [result isKindOfClass:aClass]) {
            return result;
        }
    }
    return nil;
}

// - - -
NSDictionary * arrGetDic(NSArray *arr, NSUInteger index) {
    NSDictionary *result = nil;
    if ( index<arr.count ) {
        result = [arr objectAtIndex:index];
        if ( result && [result isKindOfClass:[NSDictionary class]] ) {
            return result;
        }
    }
    return nil;
}

NSString * arrGetString(NSArray *arr, NSUInteger index) {
    id object = arrGetObject(arr, index, [NSObject class]);
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }
    if ([object isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",object];
    }
    return nil;
}

NSArray * arrGetArray(NSArray *arr, NSUInteger index) {
    return arrGetObject(arr, index, [NSArray class]);
}

#pragma mark - - Thread
void runOnMainQueueSync(void (^block)(void))
{
    if ([NSThread isMainThread])
    {
        block();
    }
    else
    {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

UIColor* webColor(NSString* hexString){
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


NSString *dicDeepTransformToJson(NSDictionary *dic){
    if(dic == nil || [dic allKeys].count == 0)
        return  nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:0 // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        BMLog(@"Got an error: %@", error);
        return nil;
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

NSString *objectDeepTransformToJson(NSObject *obj){
    if(obj == nil)
        return  nil;
    if (![obj isKindOfClass:[NSDictionary class]] && ![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:0 // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        BMLog(@"Got an error: %@", error);
        return nil;
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}




