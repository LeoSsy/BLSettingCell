//
//  BLSettingSwitchCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingSwitchCell.h"
#import <Masonry/Masonry.h>
@interface BLSettingSwitchCell()
/**右边的开关*/
@property(nonatomic,strong)UISwitch *switchV;
/**覆盖在开关上面的按钮*/
@property(nonatomic,strong)UIButton *switchButton;
@end

@implementation BLSettingSwitchCell

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    _switchV = [[UISwitch alloc] init];
    _switchV.onTintColor = self.dataModel.settingStyle.switchOnTintColor;
    [_switchV addTarget:self action:@selector(switchButtonClicked:) forControlEvents:UIControlEventValueChanged| UIControlEventTouchDragExit];
    [self.contentView addSubview:_switchV];
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_switchV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin*0.35);
        make.centerY.equalTo(self.titleL);
    }];
    [_switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(_switchV);
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
    self.switchButton.selected = dataModel.switchIsOn;
    _switchV.onTintColor = self.dataModel.settingStyle.switchOnTintColor;
    [_switchV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin*0.35);
    }];
}

#pragma mark event

/**
 开关按钮被点击了
 */
- (void)switchButtonClicked:(UISwitch*)switchV {
    //如果不需要延迟状态展示 就设置开关的状态
    if (!self.dataModel.switchIsDelyOn) {
        self.dataModel.switchOn(switchV.isOn);
    }
    if (self.dataModel.cellSwitchOperation) {
        self.dataModel.cellSwitchOperation(self.dataModel,switchV.isOn);
    }
}


@end
