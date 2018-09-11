//
//  BLSettingCellFactory.h
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLSettingModel.h"

@class BLSettingModel,BLSettingBaseCell,BLSettingStyle;

@interface BLSettingFactory : NSObject

/**
 快速生产出指定类型的cell
 @param tableView UITableView列表视图
 @param model 数据模型
 @param indexPath cell行号
 @return 指定类型的cell
 */
+ (BLSettingBaseCell*)createCellWithTableView:(UITableView*)tableView model:(BLSettingModel*)model indexPath:(NSIndexPath*)indexPath;

/**
 快速构建默认类型的cell展示模型
 @param leftIconName 左侧图标可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param isShowArrow 详情
 @param action cell点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)leftIconName title:(NSString*)title detailTitle:(NSString*)detailTitle showArrow:(BOOL)isShowArrow cellClickAction:(cellClickAction)action;

/**
 快速构建右侧辅助图标类型的cell展示模型
 @param leftIconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param rightIconName 右侧图标 可以是本地图也可以是网络图地址
 @param isShowArrow 详情
 @param action cell点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)leftIconName title:(NSString*)title rightIcon:(NSString*)rightIconName showArrow:(BOOL)isShowArrow cellClickAction:(cellClickAction)action;

/**
 快速构建开关类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param switchIsOn 是否默认开启开关
 @param action 开关点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)switchWithIcon:(NSString*)iconName title:(NSString*)title switchIsOn:(BOOL)switchIsOn switchAction:(cellSwitchAction)action;

/**
 快速构建segument类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param segumentTitlsArr segument标题数组
 @param selectIndex 选中第几个 0  1 根据标题数组来
 @param action segument点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)segumentWithIcon:(NSString*)iconName title:(NSString*)title segumentTitleArr:(NSArray*)segumentTitlsArr selectIndex:(NSInteger)selectIndex  segumentAction:(cellSegumentAction)action;

/**
 快速构建个人资料大图模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param isShowArrow 右侧图标 可以是本地图也可以是网络图地址
 @param action cell点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)avaterWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow cellClickAction:(cellClickAction)action;

/**
 快速构建文本框模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param placeHolder 文本框占位文字
 @param maxLength 文本框最大的文字长度
 @param didChangeAction 文本框文字改变回调
 @param reachesAction 文本框输入文字达到最大长度回调 用于提示
 @return BLSettingModel
 */
+ (BLSettingModel*)textFieldWithIcon:(NSString*)iconName title:(NSString*)title placeHolder:(NSString*)placeHolder textMaxLength:(NSInteger)maxLength didChangeAction:(textFieldDidChangeAction)didChangeAction reachesMaxLengthAction:(textFieldTextReachesMaxLengthAction)reachesAction;

/**
 快速子标题类型模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param subTitle 副标题
 @param switchIsOn 开关状态
 @param action cell点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)subTitleWithIcon:(NSString*)iconName title:(NSString*)title subTitle:(NSString*)subTitle switchIsOn:(BOOL)switchIsOn switchAction:(cellSwitchAction)action;

/**
 获取bundle中的资源图片
 @return image
 */
+ (UIImage*)bundleForArrowIcon;

@end
