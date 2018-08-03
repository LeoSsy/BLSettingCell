//
//  BLSettingCellFactory.h
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BLSettingModel,BLSettingBaseCell,BLSettingStyle;

@interface BLSettingFactory : NSObject

/**
 快速生产出指定类型的cell
 @param tableView UITableView列表视图
 @param model 数据模型
 @return 指定类型的cell
 */
+ (BLSettingBaseCell*)createCellWithTableView:(UITableView*)tableView model:(BLSettingModel*)model;

/**
 快速构建默认类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle;

/**
 快速构建默认类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow;

/**
 快速构建标准类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @return BLSettingModel
 */
+ (BLSettingModel*)standardWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle;

/**
 快速构建开关类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param switchIsOn 是否默认开启开关
 @return BLSettingModel
 */
+ (BLSettingModel*)switchWithIcon:(NSString*)iconName title:(NSString*)title switchIsOn:(BOOL)switchIsOn;

/**
 快速构建segument类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param selectSwitchArr segument标题数组
 @param selectIndex 选中第几个 0  1 根据标题数组来
 @return BLSettingModel
 */
+ (BLSettingModel*)segumentWithIcon:(NSString*)iconName title:(NSString*)title selectSwitchArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex;

/**
 快速构建右侧辅助图标类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param rightIconName 右侧图标 可以是本地图也可以是网络图地址
 @return BLSettingModel
 */
+ (BLSettingModel*)rightAssistWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle rightIcon:(NSString*)rightIconName;

/**
 快速构建个人资料大图模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param isShowArrow 右侧图标 可以是本地图也可以是网络图地址
 @return BLSettingModel
 */
+ (BLSettingModel*)avaterWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow;

/**
 自定义样式默认类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle settingStyle:(BLSettingStyle*)settingStyle;

/**
自定义样式默认类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow settingStyle:(BLSettingStyle*)settingStyle;

/**
自定义样式标准类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @return BLSettingModel
 */
+ (BLSettingModel*)standardWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle settingStyle:(BLSettingStyle*)settingStyle;

/**
自定义样式开关类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param switchIsOn 是否默认开启开关
 @return BLSettingModel
 */
+ (BLSettingModel*)switchWithIcon:(NSString*)iconName title:(NSString*)title switchIsOn:(BOOL)switchIsOn settingStyle:(BLSettingStyle*)settingStyle;

/**
自定义样式segument类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param selectSwitchArr segument标题数组
 @param selectIndex 选中第几个 0  1 根据标题数组来
 @return BLSettingModel
 */
+ (BLSettingModel*)segumentWithIcon:(NSString*)iconName title:(NSString*)title selectSwitchArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex settingStyle:(BLSettingStyle*)settingStyle;


/**
自定义样式右侧辅助图标类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param rightIconName 右侧图标 可以是本地图也可以是网络图地址
 @return BLSettingModel
 */
+ (BLSettingModel*)rightAssistWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle rightIcon:(NSString*)rightIconName settingStyle:(BLSettingStyle*)settingStyle;

/**
自定义样式个人资料大图cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param isShowArrow 右侧图标 可以是本地图也可以是网络图地址
 @return BLSettingModel
 */
+ (BLSettingModel*)avaterWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow settingStyle:(BLSettingStyle*)settingStyle;

@end
