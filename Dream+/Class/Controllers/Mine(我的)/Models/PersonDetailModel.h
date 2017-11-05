//
//  PersonDetailModel.h
//  Dream+
//
//  Created by macbook on 2017/11/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <BM4Group/BM4Group.h>

@interface PersonDetailModel : BMBaseModel
@property (nonatomic,copy) NSString *memberId;
@property (nonatomic,copy) NSString *cellphone;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *headImg;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *inviteCode;
@property (nonatomic,copy) NSString *parentInviteCode;
@property (nonatomic,copy) NSString *waitMemberRebatePoints;
@property (nonatomic,copy) NSString *waitBusinessRebatePoints;
@property (nonatomic,copy) NSString *registerDate;
@property (nonatomic,copy) NSString *lastLloginDate;
@property (nonatomic,copy) NSString *isBusiness;
@property (nonatomic,copy) NSString *consumePoints;
@property (nonatomic,copy) NSString *withdrawalsPoints;

@end
