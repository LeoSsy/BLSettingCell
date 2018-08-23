//
//  BLSettingGroup.h
//  BLSettingController
//
//  Created by Jack on 2018/8/20.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLSettingGroup : NSObject
/***  分组头部标题*/
@property (nonatomic, copy) NSString *header;
/***  分组头部标题高度*/
@property (nonatomic, copy) NSString *headerHeight;
/***  分组尾部标题*/
@property (nonatomic, copy) NSString *footer;
/***  分组尾部高度*/
@property (nonatomic, copy) NSString *footerHeight;
/***  存放着这组所有行的模型数据(这个数组中都是BLSettingModel对象)*/
@property (nonatomic, copy) NSArray *items;
@end
