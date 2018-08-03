//
//  BLSettingStyle.h
//  BLSettingController
//
//  Created by Jack on 2018/8/2.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLSettingStyle : NSObject
///====默认类型样式======
/**左侧图标尺寸*/
@property(nonatomic,assign)CGSize leftIconSize;
/**左侧图标是否需要圆角效果*/
@property(nonatomic,assign,getter=leftIconNeedRadius)BOOL leftIconAddRadius;
/**右侧图标尺寸*/
@property(nonatomic,assign)CGSize rightIconSize;
/**右侧图标是否需要圆角效果*/
@property(nonatomic,assign,getter=rightIconNeedRadius)BOOL rightIconAddRadius;
/**标题文字大小*/
@property(nonatomic,strong)UIFont *titleFont;
/**标题颜色*/
@property(nonatomic,strong)UIColor *titleColor;
/**描述文字大小*/
@property(nonatomic,strong)UIFont *descFont;
/**描述文字颜色*/
@property(nonatomic,strong)UIColor *descColor;
/**下划线颜色*/
@property(nonatomic,strong)UIColor *underlineColor;
/**下划线高度*/
@property(nonatomic,assign)CGFloat underlineHeight;
/**小红点颜色*/
@property(nonatomic,strong)UIColor *redDotColor;
/**小红点高度*/
@property(nonatomic,assign)CGFloat redDotSize;
/**箭头图标尺寸*/
@property(nonatomic,assign)CGSize arrowSize;
/**设置下划线左右间距 上下值设置无效*/
@property(nonatomic,assign)UIEdgeInsets cellLineEdgeInsets;
///====开关类型样式======
/**开关开启的颜色*/
@property(nonatomic,strong)UIColor *switchOnTintColor;
///====segument类型样式======
/**segument的渲染颜色*/
@property(nonatomic,strong)UIColor *segumentTintColor;
/**segument的默认状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property(nonatomic,strong)NSDictionary *segNormalTextStyle;
/**segument的选中状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property(nonatomic,strong)NSDictionary *segSelectedTextStyle;

/**
 快速初始化默认样式
 @param titleFont 标题文字大小
 @param titleColor 标题颜色
 @param descFont 描述文字大小
 @param descColor 描述文字大小
 @return BLSettingStyle
 */
+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor;

/**
 快速初始化开关样式
 @param titleFont 标题文字大小
 @param titleColor 标题颜色
 @param descFont 描述文字大小
 @param descColor 描述文字大小
 @return BLSettingStyle
 */
+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor switchOnTintColor:(UIColor*)switchOnTintColor;

/**
 快速初始化segument样式
 @param titleFont 标题文字大小
 @param titleColor 标题颜色
 @param descFont 描述文字大小
 @param descColor 描述文字大小
 @return BLSettingStyle
 */
+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor segumentTintColor:(UIColor*)segumentTintColor;

@end
