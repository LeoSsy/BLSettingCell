//
//  BLSettingModel.h
//  变啦
//
//  Created by Jack on 2018/5/9.
//  Copyright © 2018年 杭州变啦网络科技有限公司. All rights reserved.
//
//通用设置类型cell mode属性：
// 字体大小颜色等特殊样式用setUpSubViewsEffect 方法 设置

#import <UIKit/UIKit.h>
#import "BLSettingConst.h"

@class BLSettingModel;

typedef void(^cellOperationBlock)(BLSettingModel *model);
typedef void(^cellSwitchBlock)(BLSettingModel *model,BOOL switchIsOn);
typedef void(^cellSegumentBlock)(BLSettingModel *model,NSArray * selectSwitchArr,NSInteger selectIndex);

typedef BLSettingModel *(^IconNameResource)(NSString *resource);
typedef BLSettingModel *(^Text)(NSString* text);
typedef BLSettingModel *(^TextAttributeString)(NSAttributedString *attributeString);
typedef BLSettingModel *(^DisPlayStatus)(BOOL status);
typedef BLSettingModel *(^DisPlayType)(BLSettingCellType cellType);
typedef BLSettingModel *(^CellHeight)(CGFloat height);
typedef BLSettingModel *(^SettingStyle)(BLSettingStyle *settingStyle);
typedef BLSettingModel *(^SelectIndex)(NSInteger selectIndex);
typedef BLSettingModel *(^SelectSwitchArr)(NSArray * selectSwitchArr);
typedef BLSettingModel *(^CellClikedOperation)(cellOperationBlock cellOperationBlock);
typedef BLSettingModel *(^CellSwitchOperation)(cellSwitchBlock cellSwitchBlock);
typedef BLSettingModel *(^CellSegumentOperation)(cellSegumentBlock cellSegumentBlock);

@interface BLSettingModel : NSObject

/**cell类型 如果不设置就是基础的样式 显示显示图标 标题 详情 箭头*/
@property(nonatomic,copy,readonly)DisPlayType type;
/**左侧图标名字 可以是本地图片 也可以是远程图片地址*/
@property(nonatomic,copy,readonly)IconNameResource leftIconName;
/**右侧图标 可以是本地图片 也可以是远程图片地址*/
@property(nonatomic,copy,readonly)IconNameResource rightIconName;
/**箭头图标图标 可以是本地图片 也可以是远程图片地址*/
@property(nonatomic,copy,readonly)IconNameResource arrowIconName;
/**标题*/
@property(nonatomic,copy,readonly)Text titleText;
/**富文本*/
@property(nonatomic,copy,readonly)TextAttributeString titleAttribute;
/**详情*/
@property(nonatomic,copy,readonly)Text descTitle;
/**详情富文本*/
@property(nonatomic,copy,readonly)TextAttributeString descAttribute;
/**是否显示小红点*/
@property(nonatomic,copy,readonly)DisPlayStatus showRedDot;
/**是否显示左侧图标*/
@property(nonatomic,copy,readonly)DisPlayStatus showIcon;
/**是否显示箭头*/
@property(nonatomic,copy,readonly)DisPlayStatus showArrow;
/**是否显示下划线 默认显示*/
@property(nonatomic,copy,readonly)DisPlayStatus showUnderLine;
/**cell高度*/
@property(nonatomic,copy,readonly)CellHeight cellH;
/**样式对象 用于存储更细分的样式数据*/
@property(nonatomic,copy,readonly)SettingStyle style;
///=====开关相关属性======
/** 是否开启开关 该属性适用于开关类型*/
@property(nonatomic,copy,readonly)DisPlayStatus switchOn;
///=====Segument相关属性====
/** 选中第几个 0  1 该属性适用于segument类型*/
@property(nonatomic,copy,readonly)SelectIndex selIndex;
/** segument标题数组 该属性适用于segument类型*/
@property(nonatomic,copy,readonly)SelectSwitchArr segumentTitlesArr;
///回调事件相关
/** cell点击的回调*/
@property(nonatomic,copy,readonly)CellClikedOperation cellClikedOperation;
/** 开关点击的回调*/
@property(nonatomic,copy,readonly)CellSwitchOperation switchOperation;
/** Segument点击的回调*/
@property(nonatomic,copy,readonly)CellSegumentOperation segumentOperation;

/**左侧图标名字*/
@property(nonatomic,strong,readonly)NSString *iconImageName;
/**右侧图标*/
@property(nonatomic,strong,readonly)NSString *rightImageName;
/**箭头图标图标*/
@property(nonatomic,strong,readonly)NSString *arrowImageName;
/**标题*/
@property(nonatomic,strong,readonly)NSString *title;
/**富文本*/
@property(nonatomic,strong,readonly)NSAttributedString *titleAttributeString;
/**详情*/
@property(nonatomic,strong,readonly)NSString *detailTitle;
/**详情富文本*/
@property(nonatomic,strong,readonly)NSAttributedString *detailAttributeString;
/**是否显示小红点*/
@property(nonatomic,assign,readonly)BOOL isShowRedPoint;
/**是否显示左侧图标*/
@property(nonatomic,assign,readonly)BOOL isShowIcon;
/**是否显示箭头*/
@property(nonatomic,assign,readonly)BOOL isShowArrow;
/**是否显示下划线 默认显示*/
@property(nonatomic,assign,readonly)BOOL isShowUnderLine;
/**cell类型 如果不设置就是基础的样式 显示显示图标 标题 详情 箭头*/
@property(nonatomic,assign,readonly)BLSettingCellType cellType;
/**cell高度*/
@property(nonatomic,assign,readonly)CGFloat cellHeight;
/**样式对象 用于存储更细分的样式数据*/
@property(nonatomic,strong,readonly)BLSettingStyle *settingStyle;
///=====开关相关属性======
/** 是否开启开关 该属性适用于开关类型*/
@property(nonatomic,assign,readonly)BOOL switchIsOn;
///=====Segument相关属性====
/** 选中第几个 0  1 该属性适用于segument类型*/
@property(nonatomic,assign,readonly)NSInteger selectIndex;
/** segument标题数组 该属性适用于segument类型*/
@property(nonatomic,strong,readonly)NSArray * segumentTitleArr;
///回调事件相关
/** cell点击的回调*/
@property(nonatomic,strong,readonly)cellOperationBlock cellOperationBlock;
/** 开关点击的回调 该属性适用于开关类型*/
@property(nonatomic,strong,readonly)cellSwitchBlock cellSwitchBlock;
/** Segument点击的回调 该属性适用于segument类型*/
@property(nonatomic,strong,readonly)cellSegumentBlock cellSegumentBlock;

/**
 快速初始化方法
 */
+ (instancetype)model;

/** 初始化方法*/
- (instancetype)initWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle cellType:(BLSettingCellType)cellType selectSwitchArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex isShowIcon:(BOOL)isShowIcon isShowArrow:(BOOL)isShowArrow switchIsOn:(BOOL)switchIsOn rightIcon:(NSString*)rightIconName settingStyle:(BLSettingStyle*)settingStyle;
@end

@interface BLSettingGroup : NSObject
/***  分组头部标题*/
@property (nonatomic, copy) NSString *header;
/***  分组尾部标题*/
@property (nonatomic, copy) NSString *footer;
/***  存放着这组所有行的模型数据(这个数组中都是BLSettingModel对象)*/
@property (nonatomic, copy) NSArray *items;
@end


