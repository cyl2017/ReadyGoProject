//
//  UserModel.m
//
//  Created by   on 2017/4/10
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "UserModel.h"

NSString *const kUserModelId = @"memberId";
NSString *const kUserModelPhone = @"cellphone";
NSString *const kUserModelNickName = @"nickName";
NSString *const kUserModelCreateDate = @"registerDate";
NSString *const kUserModelInviteCode = @"inviteCode";

NSString *const kUserModelParentInviteCode = @"parentInviteCode";
NSString *const kUserModelSex= @"sex";
NSString *const kUserModelHeader = @"headImg";
NSString *const kUserModelPassword = @"password";
NSString *const kUserModelwaitMemberRebatePoints = @"waitMemberRebatePoints";

NSString *const kUserModelwaitBusinessRebatePoints = @"waitBusinessRebatePoints";
NSString *const kUserModellastLloginDate = @"lastLloginDate";
NSString *const kUserModelisBusiness = @"isBusiness";
NSString *const kUserModelconsumePoints = @"consumePoints";
NSString *const kUserModelwithdrawalsPoints= @"withdrawalsPoints";
NSString *const kUserModelLoginStatus = @"status";




@interface UserModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserModel

@synthesize memberId = _memberId;
@synthesize cellphone = _cellphone;
@synthesize nickName = _nickName;
@synthesize lastLloginDate = _lastLloginDate;
@synthesize parentInviteCode = _parentInviteCode;
@synthesize waitBusinessRebatePoints = _waitBusinessRebatePoints;
@synthesize waitMemberRebatePoints = _waitMemberRebatePoints;
@synthesize password = _password;
@synthesize headImg = _headImg;
@synthesize sex = _sex;
@synthesize inviteCode = _inviteCode;
@synthesize registerDate = _registerDate;
@synthesize isBusiness = _isBusiness;
@synthesize consumePoints = _consumePoints;
@synthesize withdrawalsPoints = _withdrawalsPoints;
@synthesize status = _status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.memberId = [self objectOrNilForKey:kUserModelId fromDictionary:dict];
            self.cellphone = [self objectOrNilForKey:kUserModelPhone fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kUserModelNickName fromDictionary:dict];
            self.registerDate = [self objectOrNilForKey:kUserModelCreateDate fromDictionary:dict];
            self.inviteCode = [self objectOrNilForKey:kUserModelInviteCode fromDictionary:dict];
            self.headImg = [self objectOrNilForKey:kUserModelHeader fromDictionary:dict];
            self.lastLloginDate = [self objectOrNilForKey:kUserModellastLloginDate fromDictionary:dict];
            self.password = [self objectOrNilForKey:kUserModelPassword fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kUserModelSex fromDictionary:dict];
            self.waitMemberRebatePoints = [self objectOrNilForKey:kUserModelwaitMemberRebatePoints fromDictionary:dict];
            self.waitBusinessRebatePoints = [self objectOrNilForKey:kUserModelwaitBusinessRebatePoints fromDictionary:dict];
            self.consumePoints = [self objectOrNilForKey:kUserModelconsumePoints fromDictionary:dict];
            self.withdrawalsPoints = [self objectOrNilForKey:kUserModelwithdrawalsPoints fromDictionary:dict];
            self.status = [self objectOrNilForKey:kUserModelLoginStatus fromDictionary:dict];
            self.isBusiness = [self objectOrNilForKey:kUserModelisBusiness fromDictionary:dict];
            self.parentInviteCode = [self objectOrNilForKey:kUserModelParentInviteCode fromDictionary:dict];
        

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.memberId forKey:kUserModelId];
    [mutableDict setValue:self.cellphone forKey:kUserModelPhone];
    [mutableDict setValue:self.nickName forKey:kUserModelNickName];
    [mutableDict setValue:self.registerDate forKey:kUserModelCreateDate];
    [mutableDict setValue:self.inviteCode forKey:kUserModelInviteCode];
    [mutableDict setValue:self.headImg forKey:kUserModelHeader];
    [mutableDict setValue:self.lastLloginDate forKey:kUserModellastLloginDate];
    [mutableDict setValue:self.password forKey:kUserModelPassword];
    [mutableDict setValue:self.waitBusinessRebatePoints forKey:kUserModelwaitBusinessRebatePoints];
     [mutableDict setValue:self.waitMemberRebatePoints forKey:kUserModelwaitMemberRebatePoints];
    [mutableDict setValue:self.nickName forKey:kUserModelNickName];
    [mutableDict setValue:self.consumePoints forKey:kUserModelconsumePoints];
    [mutableDict setValue:self.withdrawalsPoints forKey:kUserModelwithdrawalsPoints];
    [mutableDict setValue:self.status forKey:kUserModelLoginStatus];
    [mutableDict setValue:self.isBusiness forKey:kUserModelisBusiness];
    [mutableDict setValue:self.parentInviteCode forKey:kUserModelParentInviteCode];
    
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.memberId = [aDecoder decodeObjectForKey:kUserModelId];
    self.cellphone = [aDecoder decodeObjectForKey:kUserModelPhone];
    self.nickName = [aDecoder decodeObjectForKey:kUserModelNickName];
    self.registerDate = [aDecoder decodeObjectForKey:kUserModelCreateDate];
    self.inviteCode = [aDecoder decodeObjectForKey:kUserModelInviteCode];
    self.parentInviteCode = [aDecoder decodeObjectForKey:kUserModelParentInviteCode];
    self.sex = [aDecoder decodeObjectForKey:kUserModelSex];
    self.password = [aDecoder decodeObjectForKey:kUserModelPassword];
    self.headImg = [aDecoder decodeObjectForKey:kUserModelHeader];
    self.lastLloginDate = [aDecoder decodeObjectForKey:kUserModellastLloginDate];
    self.waitBusinessRebatePoints = [aDecoder decodeObjectForKey:kUserModelwaitBusinessRebatePoints];
    self.waitMemberRebatePoints = [aDecoder decodeObjectForKey:kUserModelwaitMemberRebatePoints];
    self.consumePoints = [aDecoder decodeObjectForKey:kUserModelconsumePoints];
    self.withdrawalsPoints = [aDecoder decodeObjectForKey:kUserModelwithdrawalsPoints];
    self.status = [aDecoder decodeObjectForKey:kUserModelLoginStatus];
    self.isBusiness = [aDecoder decodeObjectForKey:kUserModelisBusiness];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_memberId forKey:kUserModelId];
    [aCoder encodeObject:_cellphone forKey:kUserModelPhone];
    [aCoder encodeObject:_nickName forKey:kUserModelNickName];
    [aCoder encodeObject:_sex forKey:kUserModelSex];
    [aCoder encodeObject:_inviteCode forKey:kUserModelInviteCode];
    [aCoder encodeObject:_parentInviteCode forKey:kUserModelParentInviteCode];
    [aCoder encodeObject:_headImg forKey:kUserModelHeader];
    [aCoder encodeObject:_password forKey:kUserModelPassword];
    [aCoder encodeObject:_waitBusinessRebatePoints forKey:kUserModelwaitBusinessRebatePoints];
    [aCoder encodeObject:_waitMemberRebatePoints forKey:kUserModelwaitMemberRebatePoints];
    [aCoder encodeObject:_consumePoints forKey:kUserModelconsumePoints];
    [aCoder encodeObject:_withdrawalsPoints forKey:kUserModelwithdrawalsPoints];
    [aCoder encodeObject:_lastLloginDate forKey:kUserModellastLloginDate];
    [aCoder encodeObject:_registerDate forKey:kUserModelCreateDate];
    [aCoder encodeObject:_status forKey:kUserModelLoginStatus];
    [aCoder encodeObject:_isBusiness forKey:kUserModelisBusiness];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserModel *copy = [[UserModel alloc] init];
    
    if (copy) {

        copy.memberId = [self.memberId copyWithZone:zone];
        copy.cellphone = [self.cellphone copyWithZone:zone];
        copy.nickName = [self.nickName copyWithZone:zone];
        copy.registerDate = [self.registerDate copyWithZone:zone];
        copy.inviteCode = [self.inviteCode copyWithZone:zone];
        copy.parentInviteCode = [self.parentInviteCode copyWithZone:zone];
        copy.headImg = [self.headImg copyWithZone:zone];
        copy.password = [self.password copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.waitBusinessRebatePoints = [self.waitBusinessRebatePoints copyWithZone:zone];
        copy.waitMemberRebatePoints = [self.waitMemberRebatePoints copyWithZone:zone];
        copy.consumePoints = [self.consumePoints copyWithZone:zone];
        copy.withdrawalsPoints = [self.withdrawalsPoints copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.lastLloginDate = [self.lastLloginDate copyWithZone:zone];
        copy.isBusiness = [self.isBusiness copyWithZone:zone];
    }
    
    return copy;
}


@end
