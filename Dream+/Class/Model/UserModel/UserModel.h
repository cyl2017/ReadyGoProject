//
//  UserModel.h
//
//  Created by   on 2017/4/10
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *corporateName;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *inviteCode;
@property (nonatomic, strong) NSString *licenseKey;
@property (nonatomic, strong) NSString *examine;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *plantId;
@property (nonatomic, strong) NSString *shopIntro;
@property (nonatomic, strong) NSString *shopName;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *loginStatus;
@property (nonatomic, strong) NSString *businessLicenseImg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
