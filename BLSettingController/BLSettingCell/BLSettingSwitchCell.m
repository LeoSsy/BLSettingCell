//
//  BLSettingSwitchCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingSwitchCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface BLSettingSwitchCell()
/**右边的开关*/
@property(nonatomic,strong)UISwitch *switchV;
@end

@implementation BLSettingSwitchCell

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    _switchV = [[UISwitch alloc] init];
    _switchV.onTintColor = self.dataModel.settingStyle.switchOnTintColor;
    [_switchV addTarget:self action:@selector(switchStateChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:_switchV];
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_switchV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-BLSettingBaseMargin*0.35);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(BLSettingBaseSwitchW);
    }];
}

/**
 设置数据模型
 @param dataModel 数据模型
 */
- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    [super configModel:dataModel];
    [self.switchV setOn:dataModel.switchIsOn];
    _switchV.onTintColor = self.dataModel.settingStyle.switchOnTintColor;
}

#pragma mark event
/**
 开关按钮被点击了
 */
- (void)switchStateChanged:(UISwitch *)switchV {
    if (!self.dataModel) return;
    self.dataModel.switchIsOn = switchV.isOn;
    if (self.dataModel.cellSwitchBlock) {
        self.dataModel.cellSwitchBlock(self.dataModel,switchV.isOn);
    }
}

@end
