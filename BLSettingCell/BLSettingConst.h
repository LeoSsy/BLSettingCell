//
//  BLSetting.h
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLSettingStyle.h"

#define kBLSettingRatioScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kBLSettingRatioScreenHeight  [UIScreen mainScreen].bounds.size.height
#define kBLSettingRatioWithWidth(X) ((kBLSettingRatioScreenWidth) * ((X) / 375.0f))
#define BLSETTINGHEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

typedef NS_ENUM(NSUInteger, BLSettingCellType) { //cell类型
    BLSettingCellTypeNormal,    //默认类型 显示图标 标题 详情 箭头
    BLSettingCellTypeSwitch,     //开关类型 显示图标 标题 开关
    BLSettingCellTypeSegument, //Segument类型 显示图标 标题 Segument
    BLSettingCellTypeRightAssistIcon,//右侧辅助图标类型 显示图标 标题 详情 右侧图标 箭头
    BLSettingCellTypeAvater,//个人资料大头像类型 带左侧大图标 标题 描述 箭头
    BLSettingCellTypeRightTextField, //文本输入框类型 显示左侧图标 标题 文本框
    BLSettingCellTypeSex //性别选择类型 显示左侧图标 标题 性别选择视图
};

typedef NS_ENUM(NSUInteger, BLSettingNewFeatureHintType) {//cell新功能提示类型
    BLSettingNewFeatureHintTypeNone,    //默认类型 显示一个提示文字
    BLSettingNewFeatureHintTypeText,    //默认类型 显示一个提示文字
    BLSettingNewFeatureHintTypeTextRedDot,     //小红点类型 显示一个小红点
};

typedef NS_ENUM(NSUInteger, BLSettingSexSelectType) {//性别选中类型
    BLSettingSexSelectTypeLeft, //选择了左边的按钮
    BLSettingSexSelectTypeRight,//选择了右边的按钮
};

extern const CGFloat BLSettingBaseMargin; //左右间距
extern const CGFloat BLSettingBaseSwitchW; //开关宽度
extern const CGFloat BLSettingBaseSegumentW; //Segument宽度
extern const CGFloat BLSettingBaseRedpointWH; //小红点的宽高
extern const CGFloat BLSettingBaseRightIconWH; //右侧图标的宽高
