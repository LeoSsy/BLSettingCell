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

@interface BLSettingModel : NSObject
/**左侧图标名字*/
@property(nonatomic,strong)NSString *iconImageName;
/**右侧图标*/
@property(nonatomic,strong)NSString *rightImageName;
/**箭头图标图标*/
@property(nonatomic,strong)NSString *arrowImageName;
/**标题*/
@property(nonatomic,strong)NSString *title;
/**富文本*/
@property(nonatomic,strong)NSAttributedString *titleAttributeString;
/**详情*/
@property(nonatomic,strong)NSString *detailTitle;
/**详情富文本*/
@property(nonatomic,strong)NSAttributedString *detailAttributeString;
/**是否显示小红点*/
@property(nonatomic,assign)BOOL isShowRedPoint;
/**是否显示左侧图标*/
@property(nonatomic,assign)BOOL isShowIcon;
/**是否显示箭头*/
@property(nonatomic,assign)BOOL isShowArrow;
/**是否显示下划线 默认显示*/
@property(nonatomic,assign)BOOL isShowUnderLine;
/**cell类型 如果不设置就是基础的样式 显示显示图标 标题 详情 箭头*/
@property(nonatomic,assign)BLSettingCellType cellType;
/**cell高度*/
@property(nonatomic,assign)CGFloat cellHeight;
/**样式对象 用于存储更细分的样式数据*/
@property(nonatomic,strong)BLSettingStyle *settingStyle;
///=====开关相关属性======
/** 是否开启开关*/
@property(nonatomic,assign)BOOL switchIsOn;
///=====Segument相关属性====
/** 选中第几个 0  1*/
@property(nonatomic,assign)NSInteger selectIndex;
/** segument标题数组*/
@property(nonatomic,strong)NSArray * selectSwitchArr;
///回调事件相关
/** cell点击的回调*/
@property(nonatomic,strong)cellOperationBlock cellOperationBlock;
/** 开关点击的回调*/
@property(nonatomic,strong)cellSwitchBlock cellSwitchBlock;
/** Segument点击的回调*/
@property(nonatomic,strong)cellSegumentBlock cellSegumentBlock;
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


