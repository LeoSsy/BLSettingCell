//
//  BLSettingModel.m
//  变啦
//
//  Created by Jack on 2018/5/9.
//  Copyright © 2018年 杭州变啦网络科技有限公司. All rights reserved.
//

#import "BLSettingModel.h"

@implementation BLSettingModel

- (instancetype)initWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle cellType:(BLSettingCellType)cellType selectSwitchArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex isShowIcon:(BOOL)isShowIcon isShowArrow:(BOOL)isShowArrow switchIsOn:(BOOL)switchIsOn rightIcon:(NSString*)rightIconName settingStyle:(BLSettingStyle*)settingStyle {
    if (self = [super init]) {
        self.isShowUnderLine = YES;
        self.iconImageName = iconName;
        self.title =title;
        self.cellType = cellType;
        self.isShowIcon = isShowIcon;
        self.detailTitle = detailTitle;
        self.isShowArrow = isShowArrow;
        self.switchIsOn = switchIsOn;
        self.selectSwitchArr = selectSwitchArr;
        self.selectIndex = selectIndex;
        self.rightImageName = rightIconName;
        self.settingStyle = settingStyle;
        self.arrowImageName = @"BLSetting.bundle/blsetting_arrow_icon";
    }
    return self;
}

@end

@implementation BLSettingGroup
@end

