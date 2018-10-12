//
//  BLSettingStyle.h
//  BLSettingController
//
//  Created by Jack on 2018/8/2.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLSettingStyle;

typedef void (^BLSettingSexStyleAction)(UIFont **sexTitleFont,UIColor **sexTitleNormalColor,UIColor **sexTitleSelectedColor,CGFloat *sexTitleLeftMargin,CGFloat *sexViewWidth);

typedef BLSettingStyle *(^IconSize)(CGSize size);
typedef BLSettingStyle *(^AddRadius)(CGFloat radius);
typedef BLSettingStyle *(^TextFont)(UIFont * font);
typedef BLSettingStyle *(^TextFontSize)(CGFloat size);
typedef BLSettingStyle *(^PresentColor)(UIColor* color);
typedef BLSettingStyle *(^SettingSize)(CGFloat size);
typedef BLSettingStyle *(^SpaceToSuperViewLRMargin)(UIEdgeInsets insets);
typedef BLSettingStyle *(^ViewTextStyleDictionary)(NSDictionary * attributedDict);
typedef BLSettingStyle *(^TextFieldText)(NSString* text);
typedef BLSettingStyle *(^SegumentClearRadius)(BOOL status);
typedef BLSettingStyle *(^SegumentBorderWidth)(CGFloat BorderWidth);
typedef BLSettingStyle *(^SegumentClearDivider)(BOOL status);
typedef BLSettingStyle *(^SegumentItemW)(NSInteger itemW);
typedef BLSettingStyle *(^SexViewStyle)(BLSettingSexStyleAction action);
typedef BLSettingStyle *(^CellSeporatorStyle)(UITableViewCellSelectionStyle selectionStyle);

@interface BLSettingStyle : NSObject

///====外部设置属性值=====

#pragma mark 通用属性设置
/**设置cell的点击样式*/
@property (nonatomic,copy, readonly) CellSeporatorStyle cellSelectionStyle;
/**设置内容距离cell左边的间距*/
@property (nonatomic,copy, readonly) SettingSize contentLeftMargin;
/**设置内容距离cell右边的间距*/
@property (nonatomic,copy, readonly) SettingSize contentRightMargin;
/**设置左侧图标尺寸*/
@property (nonatomic,copy, readonly) IconSize leftImageSize;
/**设置右侧图标尺寸*/
@property (nonatomic,copy, readonly) IconSize rightImageSize;
/**设置左侧图标圆角大小*/
@property (nonatomic,copy, readonly) AddRadius addLeftIconRadius;
/**设置右侧图标圆角大小*/
@property (nonatomic,copy, readonly) AddRadius addRightIconRadius;
/**设置标题文字大小*/
@property (nonatomic,copy, readonly) TextFont leftTitleFont;
@property (nonatomic,copy, readonly) TextFontSize leftTitleFontSize;
/**设置标题颜色*/
@property (nonatomic,copy, readonly) PresentColor leftTitleColor;
/**设置描述文字大小*/
@property (nonatomic,copy, readonly) TextFont descTitleFont;
@property (nonatomic,copy, readonly) TextFontSize descTitleFontSize;
/**设置描述文字颜色*/
@property (nonatomic,copy, readonly) PresentColor descTitleColor;
/**设置下划线颜色*/
@property (nonatomic,copy, readonly) PresentColor bottomLineColor;
/**设置下划线高度*/
@property (nonatomic,copy, readonly) SettingSize bottomLineHeight ;
/**设置箭头图标尺寸*/
@property (nonatomic,copy, readonly) IconSize arrowIconSize;
/**设置下划线左右间距 上下值设置无效*/
@property (nonatomic,copy, readonly) SpaceToSuperViewLRMargin bottomLineEdgeInsets;
/**设置左侧标题距离左侧图标的间距 默认为为 15 设置正数则表示文字左侧距离图标距离变大，负数则距离变小*/
@property (nonatomic,copy, readonly) SettingSize leftTitleSpaceToLeftIconMargin;
/**设置右侧详情标题距离右侧箭头的间距 默认为为 -15 设置正数则表示文字右侧距离箭头距离变小，负数则距离变大*/
@property (nonatomic,copy, readonly) SettingSize rightDescSpaceToRightArrowMargin;
/**设置右侧图标距离右侧箭头的间距 默认为为 -15 设置正数则表示文字右侧距离箭头距离变小，负数则距离变大*/
@property (nonatomic,copy, readonly) SettingSize rightIconSpaceToRightArrowMargin;
/**设置个人资料类型cell的上边标题距离cell中心点Y的间距*/
@property (nonatomic,copy, readonly) SettingSize avaterTitleSpaceToCellCenterYMargin;
/**设置个人资料类型cell的下边描述标题距离cell中心点Y的间距*/
@property (nonatomic,copy, readonly) SettingSize avaterDescSpaceToCellCenterYMargin;
/**设置subtitle类型cell标题距离cell中心点Y的间距*/
@property (nonatomic,copy, readonly) SettingSize subCellTitleSpaceToCellCenterYMargin;
/**设置subtitle类型cell副标题距离cell中心点Y的间距*/
@property (nonatomic,copy, readonly) SettingSize subCellSubTitleSpaceToCellCenterYMargin;
#pragma mark 开关类型cell相关属性设置
/**设置开关开启的颜色*/
@property (nonatomic,copy, readonly) PresentColor switchOnColor;


#pragma mark segument类型cell相关属性设置
/**设置segument的渲染颜色*/
@property (nonatomic,copy, readonly) PresentColor segumentDrawingColor;
/**设置segument的默认状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property (nonatomic,copy, readonly) ViewTextStyleDictionary segumentNormalTextStyle;
/**设置segument的选中状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property (nonatomic,copy, readonly) ViewTextStyleDictionary segumentSelectedTextStyle;
/**设置segument 设置圆角是否显示*/
@property (nonatomic,copy, readonly) SegumentClearRadius segumentClearRadius;
/**设置segument 边框的宽度.*/
@property (nonatomic,copy, readonly) SegumentBorderWidth segumentBorderWidth;
/**设置segument 设置中间的分割线是否显示.*/
@property (nonatomic,copy, readonly) SegumentClearDivider segumentClearDivider;
/**设置segument 每一个item的宽度*/
@property (nonatomic,copy, readonly) SegumentItemW segumentItemW;

#pragma mark TextFidled类型cell相关属性设置
/**设置textField 占位文字颜色*/
@property(nonatomic,copy, readonly)PresentColor textFieldPlaceHolderColor;
/**设置textField 占位文字字体大小*/
@property(nonatomic,copy, readonly)TextFont textFieldPlaceHolderFont;
/**设置textField 内容文字字体*/
@property(nonatomic,copy, readonly)TextFont  textFieldTextFont;
/**设置textField 内容文字字体大小*/
@property(nonatomic,copy, readonly)TextFontSize textFieldTextFontSize;
/**设置textField 内容文字字体颜色*/
@property(nonatomic,copy, readonly)PresentColor textFieldTextColor;

#pragma mark 新版本提示相关属性
/**设置小红点颜色*/
@property (nonatomic,copy, readonly) PresentColor redPointColor;
/**设置小红点大小*/
@property (nonatomic,copy, readonly) SettingSize redPointSize;
/**设置提示文字字体*/
@property(nonatomic,copy, readonly)TextFont hintTextFont;
/**设置提示文字字体大小*/
@property(nonatomic,copy, readonly)TextFontSize hintTextFontSize;

/**设置提示文字*/
@property(nonatomic,copy, readonly)PresentColor hintTextColor;
/**设置提示视图背景颜色*/
@property(nonatomic,copy, readonly)PresentColor hintTextBgColor;
/**设置提示视图尺寸*/
@property(nonatomic,copy, readonly)AddRadius hintViewRadius;
/**设置提示视图圆角大小*/
@property(nonatomic,copy, readonly)IconSize hintViewSize;

#pragma mark 性别类型文本选择cell相关属性
/**设置左侧按钮样式*/
@property(nonatomic,copy, readonly)SexViewStyle sexLeftViewStyle;
/**设置右侧按钮样式*/
@property(nonatomic,copy, readonly)SexViewStyle sexRightViewStyle;

#pragma mark 性别类型大图选择cell相关属性
/**设置大图按钮之间的间距*/
@property(nonatomic,copy, readonly)SettingSize sexLargeImageBothMargin;

///====外部获取属性值======

#pragma mark 通用属性
/**获取cell的点击样式*/
@property (nonatomic,assign, readonly) UITableViewCellSelectionStyle selectionStyle;
/**获取内容距离cell左边的间距*/
@property (nonatomic,assign, readonly) CGFloat cellContentLeftMargin;
/**获取内容距离cell右边的间距*/
@property (nonatomic,assign, readonly) CGFloat cellContentRightMargin;
/**获取左侧图标尺寸*/
@property(nonatomic,assign, readonly)CGSize leftIconSize;
/**获取左侧图标是否需要圆角效果*/
@property(nonatomic,assign, readonly)CGFloat leftIconRadius;
/**获取右侧图标尺寸*/
@property(nonatomic,assign, readonly)CGSize rightIconSize;
/**获取右侧图标是否需要圆角效果*/
@property(nonatomic,assign, readonly)CGFloat rightIconRadius;
/**获取标题文字大小*/
@property(nonatomic,strong, readonly)UIFont *titleFont;
@property(nonatomic,assign, readonly)CGFloat titleFontSize;
/**获取标题颜色*/
@property(nonatomic,strong, readonly)UIColor *titleColor;
/**获取描述文字大小*/
@property(nonatomic,strong, readonly)UIFont *descFont;
@property(nonatomic,assign, readonly)CGFloat descFontSize;
/**获取描述文字颜色*/
@property(nonatomic,strong, readonly)UIColor *descColor;
/**获取下划线颜色*/
@property(nonatomic,strong, readonly)UIColor *underlineColor;
/**获取下划线高度*/
@property(nonatomic,assign, readonly)CGFloat underlineHeight;
/**获取箭头图标尺寸*/
@property(nonatomic,assign, readonly)CGSize arrowSize;
/**获取下划线左右间距 上下值设置无效*/
@property(nonatomic,assign, readonly)UIEdgeInsets cellLineEdgeInsets;
/**获取左侧标题距离左侧图标的间距*/
@property (nonatomic,assign, readonly) CGFloat leftTitleToLeftIconMargin;
/**获取右侧详情标题距离右侧箭头的间距*/
@property (nonatomic,assign, readonly) CGFloat rightDescToRightArrowMargin;
/**获取右侧图标距离右侧箭头的间距*/
@property (nonatomic,assign, readonly) CGFloat rightIconToRightArrowMargin;
/**获取个人资料类型cell的上边标题距离cell中心点Y的间距*/
@property (nonatomic,assign, readonly) CGFloat avaterTitleToCellCenterYMargin;
/**获取个人资料类型cell的下边描述标题距离cell中心点Y的间距*/
@property (nonatomic,assign, readonly) CGFloat avaterDescToCellCenterYMargin;
/**设置subtitle类型cell标题距离cell中心点Y的间距*/
@property (nonatomic,assign, readonly) CGFloat subCellTitleToCellCenterYMargin;
/**设置subtitle类型cell副标题距离cell中心点Y的间距*/
@property (nonatomic,assign, readonly) CGFloat subCellSubTitleToCellCenterYMargin;
#pragma mark 开关类型cell相关属性
/**获取开关开启的颜色*/
@property(nonatomic,strong, readonly)UIColor *switchOnTintColor;


#pragma mark segument类型cell相关属性
/**获取segument的渲染颜色*/
@property(nonatomic,strong, readonly)UIColor *segumentTintColor;
/**获取segument的默认状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property(nonatomic,strong, readonly)NSDictionary *segNormalTextStyle;
/**获取segument的选中状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property(nonatomic,strong, readonly)NSDictionary *segSelectedTextStyle;
/**获取segument 圆角是否显示*/
@property (nonatomic,assign, readonly) BOOL isSegumentClearRadius;
/**获取segument 边框的宽度*/
@property (nonatomic,assign, readonly) CGFloat segBorderWidth;
/**获取segument 中间的分割线是否显示.*/
@property (nonatomic,assign, readonly) BOOL isSegumentClearDivider;
/**获取segument 每一个item的宽度*/
@property (nonatomic,assign, readonly) NSInteger segItemW;

#pragma mark Textfield类型cell相关属性
/**获取textField 占位文字颜色*/
@property(nonatomic,strong, readonly)UIColor *textFieldPlaceColor;
/**获取textField 占位文字字体大小*/
@property(nonatomic,strong, readonly)UIFont *textFieldPlaceFont;
/**获取textField 内容文字字体*/
@property(nonatomic,strong, readonly)UIFont *textFieldFont;
/**获取textField 内容文字字体大小*/
@property(nonatomic,assign, readonly)CGFloat textFieldFontSize;
/**获取textField 内容文字字体颜色*/
@property(nonatomic,strong, readonly)UIColor *textFieldColor;

#pragma mark 新版本提示相关属性
/**获取新功能提示小红点颜色*/
@property(nonatomic,strong, readonly)UIColor *redDotColor;
/**获取新功能提示小红点大小*/
@property(nonatomic,assign, readonly)CGFloat redDotSize;
/**获取新功能提示文字字体*/
@property(nonatomic,strong, readonly)UIFont *hintFont;
/**获取新功能提示文字字体大小*/
@property(nonatomic,assign, readonly)CGFloat hintFontSize;
/**获取新功能提示文字*/
@property(nonatomic,strong, readonly)UIColor *hintColor;
/**获取新功能提示文字视图背景颜色*/
@property(nonatomic,strong, readonly)UIColor *hintBgColor;
/**获取新功能提示视图的尺寸*/
@property(nonatomic,assign, readonly)CGSize hintViewWH;
/**获取新功能提示文字视图圆角大小*/
@property(nonatomic,assign, readonly)CGFloat hintVRadius;

#pragma mark 性别选择类型cell相关属性
/**获取左侧按钮标题字体*/
@property(nonatomic,strong, readonly)UIFont *sexLeftTitleFont;
/**获取左侧按钮标题默认颜色*/
@property(nonatomic,strong, readonly)UIColor *sexLeftTitleNormalColor;
/**获取左侧按钮标题选中颜色*/
@property(nonatomic,strong, readonly)UIColor *sexLeftTitleSelectedColor;
/**获取左侧按钮距离图标的间距*/
@property(nonatomic,assign, readonly)CGFloat   sexLeftTitleLeftMargin;
/**获取左侧按钮视图的宽度*/
@property(nonatomic,assign, readonly)CGFloat sexLeftViewWidth;

/**获取右侧按钮标题字体*/
@property(nonatomic,strong, readonly)UIFont *sexRightTitleFont;
/**获取右侧按钮标题默认颜色*/
@property(nonatomic,strong, readonly)UIColor *sexRightTitleNormalColor;
/**获取右侧按钮标题选中颜色*/
@property(nonatomic,strong, readonly)UIColor *sexRightTitleSelectedColor;
/**获取右侧按钮距离图标的间距*/
@property(nonatomic,assign, readonly)CGFloat   sexRightTitleLeftMargin;
/**获取右侧按钮视图的宽度*/
@property(nonatomic,assign, readonly)CGFloat sexRightViewWidth;

#pragma mark 性别选择大图选择类型cell相关属性
/**获取两个大图性别按钮之间的间距*/
@property(nonatomic,assign, readonly)NSInteger sexLargeImageMargin;


/**
 快速初始化方法
 */
+ (BLSettingStyle*)style;

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
