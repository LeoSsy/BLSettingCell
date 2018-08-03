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

+ (BLSettingBaseCell*)createCellWithTableView:(UITableView*)tableView model:(BLSettingModel*)model{
    BLSettingBaseCell *cell;
    if (model.cellType == BLSettingCellTypeNormal) { //默认类型 显示 图标 标题 详情 箭头
        cell = [BLSettingNormalCell cellWithTableView:tableView withData:model];
    } else if (model.cellType == BLSettingCellTypeStandard) {//标准类型 显示图标 标题 详情
        cell = [BLSettingNormalCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeArrow){ //箭头类型 显示图标 标题 箭头
        cell = [BLSettingNormalCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeSwitch){//开关类型 显示图标 标题 开关
        cell = [BLSettingSwitchCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeSegument){//Segument类型 显示图标 标题 Segument
        cell = [BLSettingSegumentCell cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeRightAssistIcon){//右侧辅助图标类型 显示图标 标题 右侧图标 箭头
        cell = [BLSettingRightAssistIcon cellWithTableView:tableView withData:model];
    }else if (model.cellType == BLSettingCellTypeAvater){//个人资料大头像类型 带左侧大图标 标题 描述 箭头
        cell = [BLSettingAvaterCell cellWithTableView:tableView withData:model];
    }else{ //默认类型 显示 图标 标题 详情 箭头
        cell = [BLSettingNormalCell cellWithTableView:tableView withData:model];
    }
    return cell;
}

+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeNormal selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:YES switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
}

+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeNormal selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:isShowArrow switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
}

+ (BLSettingModel*)standardWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeStandard selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:YES switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
}

+ (BLSettingModel*)switchWithIcon:(NSString*)iconName title:(NSString*)title switchIsOn:(BOOL)switchIsOn{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:nil cellType:BLSettingCellTypeSwitch selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:NO switchIsOn:switchIsOn rightIcon:nil settingStyle:[BLSettingStyle new]];
}

+ (BLSettingModel*)segumentWithIcon:(NSString*)iconName title:(NSString*)title selectSwitchArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:nil cellType:BLSettingCellTypeSegument selectSwitchArr:selectSwitchArr selectIndex:selectIndex isShowIcon:iconName?YES:NO isShowArrow:NO switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
}

+ (BLSettingModel*)rightAssistWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle rightIcon:(NSString*)rightIconName{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeRightAssistIcon selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:YES switchIsOn:NO rightIcon:rightIconName settingStyle:[BLSettingStyle new]];
}

+ (BLSettingModel*)avaterWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeAvater selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:isShowArrow switchIsOn:NO rightIcon:nil settingStyle:[BLSettingStyle new]];
}

+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle settingStyle:(BLSettingStyle*)settingStyle{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeNormal selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:YES switchIsOn:NO rightIcon:nil settingStyle:settingStyle];
}

+ (BLSettingModel*)normalWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow settingStyle:(BLSettingStyle*)settingStyle {
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeNormal selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:isShowArrow switchIsOn:NO rightIcon:nil settingStyle:settingStyle];
}

+ (BLSettingModel*)standardWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle settingStyle:(BLSettingStyle*)settingStyle{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeStandard selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:YES switchIsOn:NO rightIcon:nil settingStyle:settingStyle];
}

+ (BLSettingModel*)switchWithIcon:(NSString*)iconName title:(NSString*)title switchIsOn:(BOOL)switchIsOn settingStyle:(BLSettingStyle*)settingStyle{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:nil cellType:BLSettingCellTypeSwitch selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:NO switchIsOn:switchIsOn rightIcon:nil settingStyle:settingStyle];
}

+ (BLSettingModel*)segumentWithIcon:(NSString*)iconName title:(NSString*)title selectSwitchArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex settingStyle:(BLSettingStyle*)settingStyle {
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:nil cellType:BLSettingCellTypeSegument selectSwitchArr:selectSwitchArr selectIndex:selectIndex isShowIcon:iconName?YES:NO isShowArrow:NO switchIsOn:NO rightIcon:nil settingStyle:settingStyle];
}

+ (BLSettingModel*)rightAssistWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle rightIcon:(NSString*)rightIconName settingStyle:(BLSettingStyle*)settingStyle{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeRightAssistIcon selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:YES switchIsOn:NO rightIcon:rightIconName settingStyle:settingStyle];
}

+ (BLSettingModel*)avaterWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle isShowArrow:(BOOL)isShowArrow settingStyle:(BLSettingStyle*)settingStyle{
    return [[BLSettingModel alloc] initWithIcon:iconName title:title detailTitle:detailTitle cellType:BLSettingCellTypeAvater selectSwitchArr:nil selectIndex:0 isShowIcon:iconName?YES:NO isShowArrow:isShowArrow switchIsOn:NO rightIcon:nil settingStyle:settingStyle];
}

@end
