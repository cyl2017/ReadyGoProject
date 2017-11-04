//
//  PrefectureCollectionView.h
//  WenDao
//
//  Created by 黄斌 on 2017/4/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, PrefectureCollectionType) {
    PrefectureCollectionLeft    = 0,
    PrefectureCollectionMiddle  = 1,
    PrefectureCollectionRight   = 2
};
@interface PrefectureCollectionView : UICollectionView

@property (nonatomic,assign) PrefectureCollectionType collectionType;

@end
