//
//  MessageModel.h
//  WenDao
//
//  Created by 黄斌 on 2017/4/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *createDate;
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *isRead;
@property (nonatomic,copy) NSString *phone;
@property (nonatomic,copy) NSString *plantId;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *productName;

@end
