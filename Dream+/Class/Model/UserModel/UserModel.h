//
//  UserModel.h
//
//  Created by   on 2017/4/10
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject <NSCoding, NSCopying>
@property (nonatomic, strong) NSString *memberId;
@property (nonatomic, strong) NSString *cellphone;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *nickName;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *headImg;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *inviteCode;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *parentInviteCode;
@property (nonatomic, strong) NSString *waitMemberRebatePoints;
@property (nonatomic, strong) NSString *waitBusinessRebatePoints;
@property (nonatomic, strong) NSString *registerDate;
@property (nonatomic, strong) NSString *lastLloginDate;
@property (nonatomic, strong) NSString *isBusiness;
@property (nonatomic, strong) NSString *consumePoints;
@property (nonatomic, strong) NSString *withdrawalsPoints;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
