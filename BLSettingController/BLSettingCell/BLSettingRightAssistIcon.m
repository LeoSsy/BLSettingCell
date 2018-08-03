//
//  BLSettingRightAssistIcon.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingRightAssistIcon.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface BLSettingRightAssistIcon()
/**右侧图标*/
@property(nonatomic,strong)UIImageView *rightIconV;
/**右边的箭头*/
@property(nonatomic,strong)UIImageView *arrowV;
/**是否显示箭头 默认显示*/
@property(nonatomic,assign)BOOL showArrow;
@end

@implementation BLSettingRightAssistIcon

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    
    _rightIconV = [[UIImageView alloc] init];
    _rightIconV.contentMode = UIViewContentModeScaleAspectFill;
    [ self.contentView addSubview:_rightIconV];
    
    _arrowV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BLSetting.bundle/blsetting_arrow_icon"]];
    [ self.contentView addSubview:_arrowV];
    
    //判断是否有点击事件
    if (self.dataModel.cellOperationBlock) {
        [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellClicked)]];
    }
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_arrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(_arrowV.image.size.width);
        make.height.mas_equalTo(_arrowV.image.size.height);
    }];
    
    [_rightIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrowV.mas_left).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.contentView);
        CGFloat width = self.dataModel.settingStyle.leftIconSize.width;CGFloat height = self.dataModel.settingStyle.leftIconSize.height;
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
        if (self.dataModel.settingStyle.leftIconNeedRadius) {
            self.rightIconV.layer.cornerRadius = width*0.5;
             self.rightIconV.layer.masksToBounds = YES;
        }
    }];
}

- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    [super configModel:dataModel];
    if (dataModel.arrowImageName) {    //设置左侧图标
        self.showArrow = YES;
        if ([dataModel.arrowImageName hasPrefix:@"http://"] || [dataModel.arrowImageName hasPrefix:@"https://"] ) {
            [self.arrowV sd_setImageWithURL:[NSURL URLWithString:dataModel.arrowImageName] placeholderImage:nil options:0];
        }else{
            self.arrowV.image = [UIImage imageNamed:dataModel.arrowImageName];
        }
    }else{
        self.showArrow = NO;
    }
    //设置左侧图标
    if (dataModel.rightImageName) {
        if ([dataModel.rightImageName hasPrefix:@"http://"] || [dataModel.rightImageName hasPrefix:@"https://"] ) {
            [self.rightIconV sd_setImageWithURL:[NSURL URLWithString:dataModel.rightImageName] placeholderImage:nil options:0];
        }else{
            self.rightIconV.image = [UIImage imageNamed:dataModel.rightImageName];
        }
    }
}

/**
 设置箭头是否显示
 */
- (void)setShowArrow:(BOOL)showArrow {
    _showArrow = showArrow;
    if (showArrow) {
        _arrowV.hidden = NO;
        CGFloat width = self.dataModel.settingStyle.arrowSize.width;CGFloat height = self.dataModel.settingStyle.arrowSize.height;
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        [_rightIconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_arrowV.mas_left).offset(-BLSettingBaseMargin);
        }];
    }else{
        _arrowV.hidden = YES;
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(0);
        }];
        
        [_rightIconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_arrowV.mas_left);
        }];
    }
}

#pragma mark event
/**
 cell被点击了
 */
- (void)cellClicked {
    if (!self.dataModel) return;
    if (self.dataModel.cellOperationBlock) {
        self.dataModel.cellOperationBlock(self.dataModel);
    }
}
@end
