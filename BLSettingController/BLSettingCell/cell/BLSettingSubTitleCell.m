//
//  BLSettingSubTitleCell.m
//  BLSettingController
//
//  Created by Jack on 2018/9/10.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingSubTitleCell.h"
#import <Masonry/Masonry.h>

@interface BLSettingSubTitleCell()
/**右边的开关*/
@property(nonatomic,strong)UISwitch *switchV;
/**子标题*/
@property(nonatomic,strong)UILabel *subTitleL;
@end

@implementation BLSettingSubTitleCell

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    
    _subTitleL = [[UILabel alloc] init];
    [ self.contentView addSubview:_subTitleL];
    
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
    
    CGFloat titleMargin = self.dataModel.settingStyle.subCellTitleToCellCenterYMargin;
    CGFloat subTitleMargin = self.dataModel.settingStyle.subCellSubTitleToCellCenterYMargin;

    [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).offset(-(self.dataModel.settingStyle.underlineHeight*0.5 + titleMargin));
    }];
    
    [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL);
        make.top.equalTo(self.titleL.mas_bottom).offset(subTitleMargin);
        make.right.mas_equalTo(BLSettingBaseSwitchW);
    }];
    
    [_switchV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin*0.35);
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
    [_switchV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin*0.35);
    }];
    
    //设置文字
    if (dataModel.detailTitle) {
        self.subTitleL.text = dataModel.detailTitle;
        if (dataModel.settingStyle.descFont) {
            self.subTitleL.font = dataModel.settingStyle.descFont;
        }else if(dataModel.settingStyle.descTitleFontSize){
            self.subTitleL.font = [UIFont systemFontOfSize:dataModel.settingStyle.descFontSize];
        }
        self.subTitleL.textColor = dataModel.settingStyle.descColor;
    }else if (dataModel.detailAttributeString){
       self.subTitleL.attributedText = dataModel.detailAttributeString;
    }else{
        self.subTitleL.text = nil;
    }
    
}

#pragma mark event
/**
 开关按钮被点击了
 */
- (void)switchStateChanged:(UISwitch *)switchV {
    if (!self.dataModel) return;
    self.dataModel.switchOn(switchV.isOn);
    if (self.dataModel.cellSwitchOperation) {
        self.dataModel.cellSwitchOperation(self.dataModel,switchV.isOn);
    }
}

@end
