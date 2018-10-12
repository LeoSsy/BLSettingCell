//
//  BLSettingRightAssistIcon.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingRightAssistIconCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface BLSettingRightAssistIconCell()
/**右侧图标*/
@property(nonatomic,strong)UIImageView *rightIconV;
/**右边的箭头*/
@property(nonatomic,strong)UIImageView *arrowV;
/**是否显示箭头 默认显示*/
@property(nonatomic,assign)BOOL showArrow;
@end

@implementation BLSettingRightAssistIconCell

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    
    _rightIconV = [[UIImageView alloc] init];
    _rightIconV.contentMode = UIViewContentModeScaleAspectFill;
    [ self.contentView addSubview:_rightIconV];
    
    _arrowV = [[UIImageView alloc] initWithImage:[BLSettingFactory bundleForArrowIcon]];
    [ self.contentView addSubview:_arrowV];
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_arrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
        make.centerY.equalTo(self.titleL);
        CGFloat width = self.dataModel.settingStyle.arrowSize.width;CGFloat height = self.dataModel.settingStyle.arrowSize.height;
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    
    [_rightIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowV.mas_left).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.titleL);
        CGFloat width = self.dataModel.settingStyle.rightIconSize.width;CGFloat height = self.dataModel.settingStyle.rightIconSize.height;
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
        if (self.dataModel.settingStyle.rightIconRadius) {
            self.rightIconV.layer.cornerRadius = self.dataModel.settingStyle.rightIconRadius;
             self.rightIconV.layer.masksToBounds = YES;
        }
    }];
}

- (void)configModel:(BLSettingModel *)dataModel{
    
    if (!dataModel)  return;
    
    [super configModel:dataModel];
    //设置右侧图标
    if (dataModel.rightImageObj) {
        self.rightIconV.image = dataModel.rightImageObj;
    }else if (dataModel.rightImageName){
        if ([dataModel.rightImageName hasPrefix:@"http://"] || [dataModel.rightImageName hasPrefix:@"https://"] ) {
            UIImage *placeImage = dataModel.rightIconPlaceholderName ?  [UIImage imageNamed:dataModel.rightIconPlaceholderName] : nil;
            [self.rightIconV sd_setImageWithURL:[NSURL URLWithString:dataModel.rightImageName] placeholderImage:placeImage options:0];
        }else{
            self.rightIconV.image = [UIImage imageNamed:dataModel.rightImageName];
        }
    }else if (dataModel.rightNormalImageName || dataModel.rightSelectedImageName){
        if (dataModel.cellSelected) {
            self.rightIconV.image = [UIImage imageNamed:dataModel.rightSelectedImageName];
        }else{
            self.rightIconV.image = [UIImage imageNamed:dataModel.rightNormalImageName];
        }
    }else{
        self.rightIconV.image = nil;
    }
    //箭头设置
    self.showArrow = dataModel.isShowArrow;
}

/**
 设置箭头是否显示
 */
- (void)setShowArrow:(BOOL)showArrow {
    _showArrow = showArrow;
    if (showArrow) {
        if (self.dataModel.arrowImageName) {    //设置箭头图标
            if ([self.dataModel.arrowImageName hasPrefix:@"http://"] || [self.dataModel.arrowImageName hasPrefix:@"https://"] ) {
                [self.arrowV sd_setImageWithURL:[NSURL URLWithString:self.dataModel.arrowImageName] placeholderImage:nil options:0];
            }else{
                self.arrowV.image = [UIImage imageNamed:self.dataModel.arrowImageName];
            }
        }else{
            self.arrowV.image = [BLSettingFactory bundleForArrowIcon];
        }
        _arrowV.hidden = NO;
        CGFloat width = self.dataModel.settingStyle.arrowSize.width;CGFloat height = self.dataModel.settingStyle.arrowSize.height;
        if (width==0 && height ==0) {
            width = self.arrowV.image.size.width;
            height = self.arrowV.image.size.height;
        }
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        CGFloat margin = self.dataModel.settingStyle.rightIconToRightArrowMargin != 0 ? self.dataModel.settingStyle.rightIconToRightArrowMargin : -BLSettingBaseMargin;
        [_rightIconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left).offset(margin);
        }];
    }else{
        _arrowV.hidden = YES;
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
            make.width.height.mas_equalTo(0);
        }];
        
        [_rightIconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left);
        }];
    }
}

#pragma mark event
/**
 cell被点击了
 */
- (void)cellClicked {
    [super cellClicked];
    //设置图标状态
    if (self.dataModel.rightNormalImageName || self.dataModel.rightSelectedImageName){
        if (self.dataModel.cellSelected) {
            self.rightIconV.image = [UIImage imageNamed:self.dataModel.rightSelectedImageName];
        }else{
            self.rightIconV.image = [UIImage imageNamed:self.dataModel.rightNormalImageName];
        }
    }
}
@end
