//
//  UserModel.m
//
//  Created by   on 2017/4/10
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "UserModel.h"


NSString *const kUserModelId = @"id";
NSString *const kUserModelPhone = @"phone";
NSString *const kUserModelCorporateName = @"corporateName";
NSString *const kUserModelCreateDate = @"createDate";
NSString *const kUserModelInviteCode = @"inviteCode";
NSString *const kUserModelLicenseKey = @"licenseKey";
NSString *const kUserModelExamine = @"examine";
NSString *const kUserModelPassword = @"password";
NSString *const kUserModelIcon = @"icon";
NSString *const kUserModelNickName = @"nickName";
NSString *const kUserModelPlantId = @"plantId";
NSString *const kUserModelShopIntro = @"shopIntro";
NSString *const kUserModelShopName = @"shopName";
NSString *const kUserModelStatus = @"status";
NSString *const kUserModelLoginStatus = @"loginStatus";
NSString *const kUserModelBusinessLicenseImg = @"businessLicenseImg";



@interface UserModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserModel

@synthesize id = _id;
@synthesize phone = _phone;
@synthesize corporateName = _corporateName;
@synthesize createDate = _createDate;
@synthesize inviteCode = _inviteCode;
@synthesize licenseKey = _licenseKey;
@synthesize examine = _examine;
@synthesize password = _password;
@synthesize icon = _icon;
@synthesize nickName = _nickName;
@synthesize plantId = _plantId;
@synthesize shopIntro = _shopIntro;
@synthesize shopName = _shopName;
@synthesize status = _status;
@synthesize loginStatus = _loginStatus;
@synthesize businessLicenseImg = _businessLicenseImg;

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
            self.id = [self objectOrNilForKey:kUserModelId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kUserModelPhone fromDictionary:dict];
            self.corporateName = [self objectOrNilForKey:kUserModelCorporateName fromDictionary:dict];
            self.createDate = [self objectOrNilForKey:kUserModelCreateDate fromDictionary:dict];
            self.inviteCode = [self objectOrNilForKey:kUserModelInviteCode fromDictionary:dict];
            self.licenseKey = [self objectOrNilForKey:kUserModelLicenseKey fromDictionary:dict];
            self.examine = [self objectOrNilForKey:kUserModelExamine fromDictionary:dict];
            self.password = [self objectOrNilForKey:kUserModelPassword fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kUserModelIcon fromDictionary:dict];
            self.nickName = [self objectOrNilForKey:kUserModelNickName fromDictionary:dict];
            self.plantId = [self objectOrNilForKey:kUserModelPlantId fromDictionary:dict];
            self.shopIntro = [self objectOrNilForKey:kUserModelShopIntro fromDictionary:dict];
            self.shopName = [self objectOrNilForKey:kUserModelShopName fromDictionary:dict];
            self.status = [self objectOrNilForKey:kUserModelStatus fromDictionary:dict];
            self.businessLicenseImg = [self objectOrNilForKey:kUserModelBusinessLicenseImg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.id forKey:kUserModelId];
    [mutableDict setValue:self.phone forKey:kUserModelPhone];
    [mutableDict setValue:self.corporateName forKey:kUserModelCorporateName];
    [mutableDict setValue:self.createDate forKey:kUserModelCreateDate];
    [mutableDict setValue:self.inviteCode forKey:kUserModelInviteCode];
    [mutableDict setValue:self.licenseKey forKey:kUserModelLicenseKey];
    [mutableDict setValue:self.examine forKey:kUserModelExamine];
    [mutableDict setValue:self.password forKey:kUserModelPassword];
    [mutableDict setValue:self.icon forKey:kUserModelIcon];
    [mutableDict setValue:self.nickName forKey:kUserModelNickName];
    [mutableDict setValue:self.plantId forKey:kUserModelPlantId];
    [mutableDict setValue:self.shopIntro forKey:kUserModelShopIntro];
    [mutableDict setValue:self.shopName forKey:kUserModelShopName];
    [mutableDict setValue:self.status forKey:kUserModelStatus];
    [mutableDict setValue:self.businessLicenseImg forKey:kUserModelBusinessLicenseImg];
    
    
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

    self.id = [aDecoder decodeObjectForKey:kUserModelId];
    self.phone = [aDecoder decodeObjectForKey:kUserModelPhone];
    self.corporateName = [aDecoder decodeObjectForKey:kUserModelCorporateName];
    self.createDate = [aDecoder decodeObjectForKey:kUserModelCreateDate];
    self.inviteCode = [aDecoder decodeObjectForKey:kUserModelInviteCode];
    self.licenseKey = [aDecoder decodeObjectForKey:kUserModelLicenseKey];
    self.examine = [aDecoder decodeObjectForKey:kUserModelExamine];
    self.password = [aDecoder decodeObjectForKey:kUserModelPassword];
    self.icon = [aDecoder decodeObjectForKey:kUserModelIcon];
    self.nickName = [aDecoder decodeObjectForKey:kUserModelNickName];
    self.plantId = [aDecoder decodeObjectForKey:kUserModelPlantId];
    self.shopIntro = [aDecoder decodeObjectForKey:kUserModelShopIntro];
    self.shopName = [aDecoder decodeObjectForKey:kUserModelShopName];
    self.status = [aDecoder decodeObjectForKey:kUserModelStatus];
    self.loginStatus = [aDecoder decodeObjectForKey:kUserModelLoginStatus];
    self.businessLicenseImg = [aDecoder decodeObjectForKey:kUserModelBusinessLicenseImg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_id forKey:kUserModelId];
    [aCoder encodeObject:_phone forKey:kUserModelPhone];
    [aCoder encodeObject:_corporateName forKey:kUserModelCorporateName];
    [aCoder encodeObject:_createDate forKey:kUserModelCreateDate];
    [aCoder encodeObject:_inviteCode forKey:kUserModelInviteCode];
    [aCoder encodeObject:_licenseKey forKey:kUserModelLicenseKey];
    [aCoder encodeObject:_examine forKey:kUserModelExamine];
    [aCoder encodeObject:_password forKey:kUserModelPassword];
    [aCoder encodeObject:_icon forKey:kUserModelIcon];
    [aCoder encodeObject:_nickName forKey:kUserModelNickName];
    [aCoder encodeObject:_plantId forKey:kUserModelPlantId];
    [aCoder encodeObject:_shopIntro forKey:kUserModelShopIntro];
    [aCoder encodeObject:_shopName forKey:kUserModelShopName];
    [aCoder encodeObject:_status forKey:kUserModelStatus];
    [aCoder encodeObject:_loginStatus forKey:kUserModelLoginStatus];
    [aCoder encodeObject:_businessLicenseImg forKey:kUserModelBusinessLicenseImg];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserModel *copy = [[UserModel alloc] init];
    
    if (copy) {

        copy.id = [self.id copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.corporateName = [self.corporateName copyWithZone:zone];
        copy.createDate = [self.createDate copyWithZone:zone];
        copy.inviteCode = [self.inviteCode copyWithZone:zone];
        copy.licenseKey = [self.licenseKey copyWithZone:zone];
        copy.examine = [self.examine copyWithZone:zone];
        copy.password = [self.password copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.nickName = [self.nickName copyWithZone:zone];
        copy.plantId = [self.plantId copyWithZone:zone];
        copy.shopIntro = [self.shopIntro copyWithZone:zone];
        copy.shopName = [self.shopName copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.loginStatus = [self.loginStatus copyWithZone:zone];
        copy.businessLicenseImg = [self.businessLicenseImg copyWithZone:zone];
    }
    
    return copy;
}


@end
