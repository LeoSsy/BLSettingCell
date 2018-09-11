//
//  BLSettingCellFactory.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingFactory.h"
#import "BLSetting.h"

@implementation BLSettingFactory

+ (BLSettingBaseCell*)createCellWithTableView:(UITableView*)tableView model:(BLSettingModel*)model indexPath:(NSIndexPath*)indexPath{
    BLSettingBaseCell *cell;
    if (model.cellType == BLSettingCellTypeNormal) { //默认类型 显示 图标 标题 详情 箭头
        cell = [BLSettingNormalCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeSwitch){//开关类型 显示图标 标题 开关
        cell = [BLSettingSwitchCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeSegument){//Segument类型 显示图标 标题 Segument
        cell = [BLSettingSegumentCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeRightAssistIcon){//右侧辅助图标类型 显示图标 标题 右侧图标 箭头
        cell = [BLSettingRightAssistIconCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeAvater){//个人资料大头像类型 带左侧大图标 标题 描述 箭头
        cell = [BLSettingAvaterCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeRightTextField){//右边文本框类型
        cell = [BLSettingRightTextFieldCell cellWithTableView:tableView withData:model];
    }else if(model.cellType == BLSettingCellTypeSex){//性别文本选择类型
        cell = [BLSettingSexCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeSexLargeImage){//性别大图选择类型
        cell = [BLSettingSexLargeImageCell cellWithTableView:tableView withData:model];
    }else if(model.cellType ==  BLSettingCellTypeSubTitle){//子标题类型
        cell = [BLSettingSubTitleCell cellWithTableView:tableView withData:model];
    }else { //默认类型 显示 图标 标题 详情 箭头
        cell = [BLSettingNormalCell cellWithTableView:tableView withData:model];
    }
    //设置数据
    model.indexPath = indexPath;
    [cell configModel:model];
    return cell;
}

/**
 快速构建默认类型的cell展示模型
 @param leftIconName 左侧图标可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param isShowArrow 详情
 @param action cell点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)leftIconName title:(NSString*)title detailTitle:(NSString*)detailTitle showArrow:(BOOL)isShowArrow cellClickAction:(cellClickAction)action{
    BLSettingModel *model =  [[BLSettingModel alloc] initWithIcon:leftIconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeNormal segumentTitleArr:nil selectIndex:0 isShowArrow:isShowArrow switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
    model.cellClikedAction(action);
    return model;
}

/**
 快速构建右侧辅助图标类型的cell展示模型
 @param leftIconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param rightIconName 右侧图标 可以是本地图也可以是网络图地址
 @param isShowArrow 详情
 @param action cell点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)normalWithIcon:(NSString*)leftIconName title:(NSString*)title rightIcon:(NSString*)rightIconName showArrow:(BOOL)isShowArrow cellClickAction:(cellClickAction)action{
    BLSettingModel *model =  [[BLSettingModel alloc] initWithIcon:leftIconName title:title detailTitle:nil cellType:BLSettingCellTypeRightAssistIcon segumentTitleArr:nil selectIndex:0 isShowArrow:isShowArrow switchIsOn:NO rightIcon:rightIconName settingStyle:[BLSettingStyle new]];
    model.cellClikedAction(action);
    return model;
}

/**
 快速构建开关类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param switchIsOn 是否默认开启开关
 @param action 开关点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)switchWithIcon:(NSString*)iconName title:(NSString*)title switchIsOn:(BOOL)switchIsOn switchAction:(cellSwitchAction)action{
    BLSettingModel *model =   [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:nil cellType:BLSettingCellTypeSwitch segumentTitleArr:nil selectIndex:0  isShowArrow:NO switchIsOn:switchIsOn rightIcon:nil settingStyle:[BLSettingStyle new]];
    model.switchAction(action);
    return model;
}

/**
 快速构建segument类型的cell展示模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param segumentTitlsArr segument标题数组
 @param selectIndex 选中第几个 0  1 根据标题数组来
 @param action segument点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)segumentWithIcon:(NSString*)iconName title:(NSString*)title segumentTitleArr:(NSArray*)segumentTitlsArr selectIndex:(NSInteger)selectIndex  segumentAction:(cellSegumentAction)action{
    BLSettingModel *model =  [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:nil cellType:BLSettingCellTypeSegument segumentTitleArr:segumentTitlsArr selectIndex:selectIndex  isShowArrow:NO switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
    model.segumentAction(action);
    return model;
}

/**
 快速构建个人资料大图模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param detailTitle 详情
 @param isShowArrow 右侧图标 可以是本地图也可以是网络图地址
 @param action cell点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)avaterWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow cellClickAction:(cellClickAction)action{
    BLSettingModel *model =  [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeAvater segumentTitleArr:nil selectIndex:0  isShowArrow:isShowArrow switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
    model.cellClikedAction(action);
    return model;
}

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
+ (BLSettingModel*)textFieldWithIcon:(NSString*)iconName title:(NSString*)title placeHolder:(NSString*)placeHolder textMaxLength:(NSInteger)maxLength didChangeAction:(textFieldDidChangeAction)didChangeAction reachesMaxLengthAction:(textFieldTextReachesMaxLengthAction)reachesAction{
    BLSettingModel *model =  [BLSettingModel model];
    model.type(BLSettingCellTypeRightTextField)
    .leftIconName(iconName).titleText(title).textFieldPlaceHolder(placeHolder)
    .textFieldTextMaxLength(maxLength).textFieldDidChangeAction(didChangeAction)
    .textFieldTextReachesMaxLengthAction(reachesAction)
    .style([BLSettingStyle style]);
    return model;
}


/**
 快速子标题类型模型
 @param iconName 可以是本地图也可以是网络图地址
 @param title 标题
 @param subTitle 副标题
 @param switchIsOn 开关状态
 @param action 开关点击事件
 @return BLSettingModel
 */
+ (BLSettingModel*)subTitleWithIcon:(NSString*)iconName title:(NSString*)title subTitle:(NSString*)subTitle switchIsOn:(BOOL)switchIsOn switchAction:(cellSwitchAction)action{
    //样式对象
    BLSettingStyle *style = [BLSettingStyle style];
    style.leftTitleFont([UIFont systemFontOfSize:15]).leftTitleColor(BLSETTINGHEXCOLOR(0x3f3f3f)).descTitleFont([UIFont systemFontOfSize:11]).descTitleColor(BLSETTINGHEXCOLOR(0xd5d5d5));
    //带样式初始化方法
    BLSettingModel *model =  [BLSettingModel modelStyle:style];
    model.type(BLSettingCellTypeSubTitle).cellH(50)
    .leftIconName(iconName).titleText(title).descTitle(subTitle).switchOn(switchIsOn).switchAction(action).style(style);
    return model;
}


+ (UIImage*)bundleForArrowIcon{
    NSBundle * bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[BLSettingBaseCell class]] pathForResource:@"BLSetting" ofType:@"bundle"]];
    UIImage *image = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"blsetting_arrow_icon@2x" ofType:@"png"]];
    return image;
}
@end
