//
//  ToolKit.h
//  Pods
//
//  Created by LeungL on 16/6/2.
//
//

#import <Foundation/Foundation.h>

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

@interface ToolKit : NSObject

@end

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

@interface NSMutableDictionary (SafeSet)
- (void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey;
@end

@interface NSMutableArray (SafeAdd)
- (void)safe_addObject:(id)anObject;
@end

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// NSDictionary
id dicGetObject(NSDictionary * dic, id aKey, Class aClass);

NSDictionary * dicGetDic(NSDictionary *dic, id aKey);
NSArray * dicGetArray(NSDictionary *dic, id aKey);
NSArray * dicGetArraySafe(NSDictionary *dic, id aKey);

NSString * dicGetString(NSDictionary *dic, id aKey);
NSString * dicGetStringSafe(NSDictionary *dic, id aKey);

int   dicGetInt(NSDictionary *dic, id aKey, int nDefault);
float dicGetFloat(NSDictionary *dic, id aKey, float fDefault);
BOOL  dicGetBool(NSDictionary *dic, id aKey, BOOL bDefault);

// NSArray
id arrGetObject(NSArray *arr, NSUInteger index, Class aClass);
NSDictionary * arrGetDic(NSArray *arr, NSUInteger index);
NSString * arrGetString(NSArray *arr, NSUInteger index);
NSArray * arrGetArray(NSArray *arr, NSUInteger index);

// Thread
void runOnMainQueueSync(void (^block)(void));

UIColor * webColor(NSString * hexString);

NSString *dicDeepTransformToJson(NSDictionary *dic);
NSString *objectDeepTransformToJson(NSObject *obj);
