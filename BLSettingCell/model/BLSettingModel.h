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


typedef void(^cellClickAction)(BLSettingModel *model);
typedef void(^cellSwitchAction)(BLSettingModel *model,BOOL switchIsOn);
typedef void(^cellSegumentAction)(BLSettingModel *model,NSArray * segumentTitlsArr,NSInteger selectIndex);
typedef void(^textFieldDidChangeAction)(BLSettingModel *model,UITextField *textField);
typedef void(^textFieldTextReachesMaxLengthAction)(BLSettingModel *model,UITextField *textField);
typedef void(^sexAction)(BLSettingModel *model,BLSettingSexSelectType sexSelType);
typedef void (^sexVDataConfig)(NSString **sexTitle,NSString **sexNormalImage,NSString **sexSelectedImage);
typedef void (^sexLargeImageDataConfig)(NSString **normalImage,NSString **selectedImage);

typedef BLSettingModel *(^IconNameResource)(NSString *resource);
typedef BLSettingModel *(^IconImage)(UIImage *image);
typedef BLSettingModel *(^Text)(NSString* text);
typedef BLSettingModel *(^TextAttributeString)(NSAttributedString *attributeString);
typedef BLSettingModel *(^DisPlayStatus)(BOOL status);
typedef BLSettingModel *(^DisPlayType)(BLSettingCellType cellType);
typedef BLSettingModel *(^CellHeight)(CGFloat height);
typedef BLSettingModel *(^SettingStyle)(BLSettingStyle *settingStyle);
typedef BLSettingModel *(^SegumentSelectIndex)(NSInteger selectIndex);
typedef BLSettingModel *(^SegumentTitlsArr)(NSArray * segumentTitlsArr);
typedef BLSettingModel *(^CellClikedOperation)(cellClickAction cellOperation);
typedef BLSettingModel *(^CellSwitchOperation)(cellSwitchAction cellSwitchOperation);
typedef BLSettingModel *(^CellSegumentOperation)(cellSegumentAction cellSegumentOperation);
typedef BLSettingModel *(^TextFieldTextMaxLength)(NSInteger maxLength);
typedef BLSettingModel *(^TextFieldTextReachesMaxLengthAction)(textFieldTextReachesMaxLengthAction action);
typedef BLSettingModel *(^TextFieldDidChangeAction)(textFieldDidChangeAction action);
typedef BLSettingModel *(^TextFieldKeyboardType)(UIKeyboardType type);
typedef BLSettingModel *(^NewFeatureHintType)(BLSettingNewFeatureHintType type);
typedef BLSettingModel *(^SexAction)(sexAction action);
typedef BLSettingModel *(^SexSelType)(BLSettingSexSelectType sexSelType);
typedef BLSettingModel *(^SexViewDataConfig)(sexVDataConfig config);
typedef BLSettingModel *(^SexViewLargeImageDataConfig)(sexLargeImageDataConfig config);
typedef BLSettingModel *(^TextAlignmentMode)(NSTextAlignment alignment);
typedef BLSettingModel *(^ExtDictionary)(NSMutableDictionary *ext);


@interface BLSettingModel : NSObject
///====外部设置属性值=====

#pragma mark cell属性设置
/**设置cell类型 如果不设置就是基础的样式 显示显示图标 标题 详情 箭头*/
@property(nonatomic,copy,readonly)DisPlayType type;
/**设置cell高度*/
@property(nonatomic,copy,readonly)CellHeight cellH;
/**设置样式对象 用于存储更细分的样式数据*/
@property(nonatomic,copy,readonly)SettingStyle style;

#pragma mark 通用属性设置设置
/**设置左侧图标名字 可以是本地图片 也可以是远程图片地址*/
@property(nonatomic,copy,readonly)IconNameResource leftIconName;
/**设置左侧占位图片 必须是本地图片*/
@property(nonatomic,copy,readonly)IconNameResource leftIconPlaceholder;
/**设置左侧图标 传入一个UIImage对象*/
@property(nonatomic,copy,readonly)IconImage leftIconImage;
/**设置左侧图标多状态图片 默认状态和选中状态图片*/
@property(nonatomic,copy,readonly)SexViewLargeImageDataConfig leftIconNormalSelImageName;
/**设置右侧图标 可以是本地图片 也可以是远程图片地址*/
@property(nonatomic,copy,readonly)IconNameResource rightIconName;
/**设置右侧占位图片 必须是本地图片*/
@property(nonatomic,copy,readonly)IconNameResource rightIconPlaceholder;
/**设置右侧图标 传入一个UIImage对象*/
@property(nonatomic,copy,readonly)IconImage rightIconImage;
/**设置右侧图标多状态图片 默认状态和选中状态图片*/
@property(nonatomic,copy,readonly)SexViewLargeImageDataConfig rightIconNormalSelImageName;
/**设置箭头图标图标 可以是本地图片 也可以是远程图片地址*/
@property(nonatomic,copy,readonly)IconNameResource arrowIconName;
/**设置标题*/
@property(nonatomic,copy,readonly)Text titleText;
/**设置富文本*/
@property(nonatomic,copy,readonly)TextAttributeString titleAttribute;
/**设置详情*/
@property(nonatomic,copy,readonly)Text descTitle;
/**设置详情富文本*/
@property(nonatomic,copy,readonly)TextAttributeString descAttribute;
/**设置是否显示左侧图标*/
@property(nonatomic,copy,readonly)DisPlayStatus showIcon;
/**设置是否显示箭头*/
@property(nonatomic,copy,readonly)DisPlayStatus showArrow;
/**设置是否显示下划线 默认显示*/
@property(nonatomic,copy,readonly)DisPlayStatus showUnderLine;
/**设置扩展属性字段*/
@property(nonatomic,copy,readonly)ExtDictionary extDictionary;

#pragma mark 开关类型cell相关属性设置

/**设置是否开启开关 该属性适用于开关类型*/
@property(nonatomic,copy,readonly)DisPlayStatus switchOn;
/**设置开关状态是否延迟响应 设置为YES后，开关的状态改变需要外部在事件回调中，改变模型值 并刷新视图*/
@property(nonatomic,copy,readonly)DisPlayStatus switchDelyOn;

#pragma mark Segument类型cell相关属性设置

/**设置选中第几个 0  1 该属性适用于segument类型*/
@property(nonatomic,copy,readonly)SegumentSelectIndex segumentSelIndex;
/**设置segument标题数组 该属性适用于segument类型*/
@property(nonatomic,copy,readonly)SegumentTitlsArr segumentTitlesArr;

#pragma mark textField类型cell相关属性设置
/**设置textField 占位文字*/
@property(nonatomic,copy, readonly)Text textFieldPlaceHolder;
/**设置textField 展示文字*/
@property(nonatomic,copy, readonly)Text textFieldText;
/**设置textField 最大显示文字长度 默认20个字符*/
@property(nonatomic,copy, readonly)TextFieldTextMaxLength textFieldTextMaxLength;
/**设置textField 是否可以编辑*/
@property(nonatomic,copy, readonly)DisPlayStatus textFieldEnabled;
/**设置textField 的键盘类型*/
@property(nonatomic,copy, readonly)TextFieldKeyboardType textFieldKeyboardType;
/**设置textField 的文字对齐方式 默认右对齐*/
@property(nonatomic,copy, readonly)TextAlignmentMode textFieldTextAlignmentMode;

#pragma mark 新版本或新功能提示相关属性设置
/**设置新功能提醒类型*/
@property(nonatomic,copy,readonly)NewFeatureHintType hintViewType;
/**设置新功能提示视图提示文字*/
@property(nonatomic,copy, readonly)Text hintText;

#pragma mark 性别选择文本选择类型cell相关属性
/**设置性别cell按钮选中的类型*/
@property(nonatomic,copy, readonly)SexSelType sexSelType;
/**设置性别cell左侧视图数据*/
@property(nonatomic,copy, readonly)SexViewDataConfig sexLeftViewData;
/**设置性别cell右侧视图数据*/
@property(nonatomic,copy, readonly)SexViewDataConfig sexRightViewData;

#pragma mark 性别选择大图选择类型cell相关属性
/**设置性别大图cell右侧视图数据*/
@property(nonatomic,copy, readonly)SexViewLargeImageDataConfig sexLeftLargeImageData;
/**设置性别大图cell右侧视图数据*/
@property(nonatomic,copy, readonly)SexViewLargeImageDataConfig sexRightLargeImageData;

#pragma mark 回调事件相关

/** 设置cell点击的回调*/
@property(nonatomic,copy,readonly)CellClikedOperation cellClikedAction;
/** 设置开关点击的回调*/
@property(nonatomic,copy,readonly)CellSwitchOperation switchAction;
/** 设置Segument点击的回调*/
@property(nonatomic,copy,readonly)CellSegumentOperation segumentAction;
/** 设置文本框文字发生改变的回调*/
@property(nonatomic,copy,readonly)TextFieldDidChangeAction textFieldDidChangeAction;
/** 设置文本框文本输入字数达到最大值的回调*/
@property(nonatomic,copy,readonly)TextFieldTextReachesMaxLengthAction textFieldTextReachesMaxLengthAction;
/** 设置性别选择cell的按钮点击的回调*/
@property(nonatomic,copy,readonly)SexAction sexAction;

///====外部获取属性值======

#pragma mark cell属性
/**获取cell类型 如果不设置就是基础的样式 显示显示图标 标题 详情 箭头*/
@property(nonatomic,assign,readonly)BLSettingCellType cellType;
/**获取样式对象 用于存储更细分的样式数据*/
@property(nonatomic,strong,readonly)BLSettingStyle *settingStyle;
/**获取或设置cell的行号*/
@property(nonatomic,strong,readwrite)NSIndexPath *indexPath;
/**获取cell高度*/
@property(nonatomic,assign,readonly)CGFloat cellHeight;
/**获取或设置cell当前的选中状态 YES 选中了 NO 取消选中*/
@property(nonatomic,assign,readwrite,getter=isCellSelected)BOOL cellSelected;

#pragma mark 通用属性

/**获取左侧图标名字*/
@property(nonatomic,strong,readonly)NSString *leftImageName;
/**获取左侧占位图片名称*/
@property(nonatomic,copy,readonly)NSString *leftIconPlaceholderName;
/**获取左侧图标 得到的是一个UIImage对象*/
@property(nonatomic,strong,readonly)UIImage* leftImageObj;
//====左侧图标多状态属性====
/**获取左侧图标默认展示图片*/
@property(nonatomic,strong,readonly)NSString *leftNormalImageName;
/**获取左侧图标cell选中的时候展示的图片*/
@property(nonatomic,strong,readonly)NSString *leftSelectedImageName;
/**获取右侧图标*/
@property(nonatomic,strong,readonly)NSString *rightImageName;
/**获取右侧占位图片名称*/
@property(nonatomic,copy,readonly)NSString *rightIconPlaceholderName;
/**获取右侧图标 得到的是一个UIImage对象*/
@property(nonatomic,strong,readonly)UIImage* rightImageObj;
//====右侧图标多状态属性====
/**获取右侧图标默认展示图片*/
@property(nonatomic,strong,readonly)NSString *rightNormalImageName;
/**获取右侧图标cell选中的时候展示的图片*/
@property(nonatomic,strong,readonly)NSString *rightSelectedImageName;

/**获取箭头图标图标*/
@property(nonatomic,strong,readonly)NSString *arrowImageName;
/**获取标题*/
@property(nonatomic,strong,readonly)NSString *title;
/**获取富文本*/
@property(nonatomic,strong,readonly)NSAttributedString *titleAttributeString;
/**获取详情*/
@property(nonatomic,strong,readonly)NSString *detailTitle;
/**获取详情富文本*/
@property(nonatomic,strong,readonly)NSAttributedString *detailAttributeString;
/**获取是否显示箭头*/
@property(nonatomic,assign,readonly)BOOL isShowArrow;
/**获取是否显示下划线 默认显示*/
@property(nonatomic,assign,readonly)BOOL isShowUnderLine;
/**获取扩展属性字段*/
@property(nonatomic,strong)NSMutableDictionary *ext;

#pragma mark 开关类型cell相关属性

/** 获取是否开启开关 该属性适用于开关类型*/
@property(nonatomic,assign,readonly)BOOL switchIsOn;
/**获取开关状态是否延迟响应*/
@property(nonatomic,assign,readonly)BOOL switchIsDelyOn;

#pragma mark Segument类型cell相关属性
/** 获取选中第几个 0  1 该属性适用于segument类型*/
@property(nonatomic,assign,readonly)NSInteger selectIndex;
/** 获取segument标题数组 该属性适用于segument类型*/
@property(nonatomic,strong,readonly)NSArray * segumentTitleArr;

#pragma mark textField类型cell相关属性
/**获取textField 占位文字*/
@property(nonatomic,strong, readonly)NSString *textFieldPlaceHolderText;
/**获取textField 展示文字*/
@property(nonatomic,strong, readonly)NSString *textFieldString;
/**获取textField 最大显示文字长度 默认20个字符*/
@property(nonatomic,assign, readonly)NSInteger textFieldStringMaxLength;
/**获取textField 是否禁用文本框输入功能*/
@property(nonatomic,assign, readonly,getter=textFieldIsCanEditing)BOOL textFieldCanEditing;
/**获取textField 的键盘类型*/
@property(nonatomic,assign, readonly)UIKeyboardType textFieldKeyboardtype;
/**获取textField 的文字对齐方式 默认右对齐*/
@property(nonatomic,assign, readonly)NSTextAlignment textFieldTextAlignment;

#pragma mark 新版本或新功能提示相关属性
/**获取新功能提醒类型*/
@property(nonatomic,assign,readonly)BLSettingNewFeatureHintType hintType;
/**获取新功能提示视图提示文字*/
@property(nonatomic,strong, readonly)NSString *hintString;

#pragma mark 性别选择文本选择类型cell相关属性
/**获取性别选中的类型*/
@property(nonatomic,assign, readonly)BLSettingSexSelectType sexSelectType;
/**获取左侧按钮默认图标*/
@property(nonatomic,strong, readonly)NSString *sexLeftNormalImage;
/**获取左侧按钮选中图标*/
@property(nonatomic,strong, readonly)NSString *sexLeftSelectedImage;
/**获取左侧按钮标题*/
@property(nonatomic,strong, readonly)NSString *sexLeftTitle;
/**获取右侧按钮默认图标*/
@property(nonatomic,strong, readonly)NSString *sexRightNormalImage;
/**获取右侧按钮选中图标*/
@property(nonatomic,strong, readonly)NSString *sexRightSelectedImage;
/**获取右侧按钮标题*/
@property(nonatomic,strong, readonly)NSString *sexRightTitle;

#pragma mark 回调事件相关
/** 获取cell点击的回调*/
@property(nonatomic,copy,readonly)cellClickAction cellClickOperation;
/** 获取开关点击的回调 该属性适用于开关类型*/
@property(nonatomic,copy,readonly)cellSwitchAction cellSwitchOperation;
/** 获取Segument点击的回调 该属性适用于segument类型*/
@property(nonatomic,copy,readonly)cellSegumentAction cellSegumentOperation;
/** 获取文本框文字发生改变的回调*/
@property(nonatomic,copy,readonly)textFieldDidChangeAction textFieldDidChangeOperation;
/** 获取文本框文本输入字数达到最大值的回调*/
@property(nonatomic,copy,readonly)textFieldTextReachesMaxLengthAction textFieldTextMaxLengthOperation;
/** 获取性别选择cell的按钮点击的回调*/
@property(nonatomic,copy,readonly)sexAction sexOperation;

/**
 快速初始化方法
 */
+ (instancetype)model;
/**
 快速初始化方法
 @param cellType cell类型
 */
+ (instancetype)modelType:(BLSettingCellType)cellType;
/**
 快速初始化方法
 @param settingStyle cell样式对象
 */
+ (instancetype)modelStyle:(BLSettingStyle*)settingStyle;
/**
 快速初始化方法
 @param cellType cell类型
 @param settingStyle cell样式对象
 */
+ (instancetype)modelType:(BLSettingCellType)cellType style:(BLSettingStyle*)settingStyle;
/** 初始化方法*/
- (instancetype)initWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle cellType:(BLSettingCellType)cellType segumentTitleArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex isShowArrow:(BOOL)isShowArrow switchIsOn:(BOOL)switchIsOn rightIcon:(NSString*)rightIconName settingStyle:(BLSettingStyle*)settingStyle;
@end




