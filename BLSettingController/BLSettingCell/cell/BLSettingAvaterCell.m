//
//  BLSettingAvaterCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingAvaterCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface BLSettingAvaterCell()
/**右边的标题*/
@property(nonatomic,strong)UILabel *descL;
/**右侧图标*/
@property(nonatomic,strong)UIImageView *rightIconV;
/**右边的箭头*/
@property(nonatomic,strong)UIImageView *arrowV;
/**是否显示箭头 默认显示*/
@property(nonatomic,assign)BOOL showArrow;
/**是否显示左侧图标 默认不显示*/
@property(nonatomic,assign)BOOL showIcon;
@end

@implementation BLSettingAvaterCell

/**
 布局子视图
 */
- (void)buildSubview {
    [super buildSubview];
    
    _descL = [[UILabel alloc] init];
    _descL.font = [UIFont systemFontOfSize:kBLSettingRatioWithWidth(14)];
    _descL.textColor = BLSETTINGHEXCOLOR(0x4e4e4e);
    _descL.textAlignment = NSTextAlignmentRight;
    [ self.contentView addSubview:_descL];
    
    _rightIconV = [[UIImageView alloc] init];
    _rightIconV.contentMode = UIViewContentModeScaleAspectFill;
    [ self.contentView addSubview:_rightIconV];
    
    _arrowV = [[UIImageView alloc] initWithImage:[BLSettingFactory bundleForArrowIcon]];
    [ self.contentView addSubview:_arrowV];
}

/**
 *  布局子视图
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_arrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
        make.centerY.equalTo(self.contentView).offset(-self.dataModel.settingStyle.underlineHeight*0.5);
        CGFloat width = self.dataModel.settingStyle.arrowSize.width;CGFloat height = self.dataModel.settingStyle.arrowSize.height;
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    
    [_rightIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowV.mas_left).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.arrowV);
        CGFloat width = self.dataModel.settingStyle.rightIconSize.width;CGFloat height = self.dataModel.settingStyle.rightIconSize.height;
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
        if (self.dataModel.settingStyle.rightIconRadius) {
            self.rightIconV.layer.cornerRadius = self.dataModel.settingStyle.rightIconRadius;
            self.rightIconV.layer.masksToBounds = YES;
        }
    }];
    
    [self.iconV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(self.dataModel.settingStyle.cellContentLeftMargin);
        make.centerY.equalTo(self.arrowV);
        CGFloat width = self.dataModel.settingStyle.leftIconSize.width;CGFloat height = self.dataModel.settingStyle.leftIconSize.height;
        if (self.dataModel.settingStyle.rightIconRadius) {
            self.iconV.layer.cornerRadius = self.dataModel.settingStyle.rightIconRadius;
        }
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    
    CGFloat titleMargin = self.dataModel.settingStyle.avaterTitleToCellCenterYMargin > 0 ? self.dataModel.settingStyle.avaterTitleToCellCenterYMargin : 0;
    CGFloat descMargin = self.dataModel.settingStyle.avaterDescToCellCenterYMargin> 0 ? self.dataModel.settingStyle.avaterDescToCellCenterYMargin : 0;

    [self.titleL mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconV.mas_right).offset(BLSettingBaseMargin);
        make.bottom.equalTo(self.contentView.mas_centerY).offset(titleMargin);
    }];
    
    [_descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleL.mas_bottom).offset(descMargin);
        make.left.equalTo(self.titleL);
    }];
}

/**
 设置数据模型
 @param dataModel 数据模型
 */
- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    
    self.showArrow = dataModel.isShowArrow;
    self.underline.hidden = !dataModel.isShowUnderLine;
    self.underline.backgroundColor = self.dataModel.settingStyle.underlineColor;

    if (dataModel.title) {
        self.titleL.text = dataModel.title;
        if (dataModel.settingStyle.titleFont) {
            self.titleL.font = dataModel.settingStyle.titleFont;
        }else if(dataModel.settingStyle.titleFontSize){
            self.titleL.font = [UIFont systemFontOfSize:dataModel.settingStyle.titleFontSize];
        }
        self.titleL.textColor = dataModel.settingStyle.titleColor;
    }else if (dataModel.titleAttributeString){
        self.titleL.attributedText = dataModel.titleAttributeString;
    }else{
        self.titleL.text = nil;
    }
    
    if (dataModel.detailTitle) {
        self.descL.text = dataModel.detailTitle;
        if (dataModel.settingStyle.descFont) {
            _descL.font = dataModel.settingStyle.descFont;
        }else if(dataModel.settingStyle.descTitleFontSize){
            _descL.font = [UIFont systemFontOfSize:dataModel.settingStyle.descFontSize];
        }
        _descL.textColor = dataModel.settingStyle.descColor;
    }else if (dataModel.detailAttributeString){
        self.descL.attributedText = dataModel.detailAttributeString;
    }else{
        self.descL.text = nil;
    }
    
    if (self.dataModel.leftImageName) {    //设置左侧图标
        self.showIcon = YES;
        if ([self.dataModel.leftImageName hasPrefix:@"http://"] || [self.dataModel.leftImageName hasPrefix:@"https://"] ) {
            [self.iconV sd_setImageWithURL:[NSURL URLWithString:self.dataModel.leftImageName] placeholderImage:nil options:0];
        }else{
            self.iconV.image = [UIImage imageNamed:self.dataModel.leftImageName];
        }
    }else{
        self.showIcon = NO;
    }
    
    if (dataModel.rightImageName) {    //设置右侧图标
        self.rightIconV.hidden = NO;
        if ([dataModel.rightImageName hasPrefix:@"http://"] || [dataModel.rightImageName hasPrefix:@"https://"] ) {
            [self.rightIconV sd_setImageWithURL:[NSURL URLWithString:dataModel.rightImageName] placeholderImage:nil options:0];
        }else{
            self.rightIconV.image = [UIImage imageNamed:dataModel.rightImageName];
        }
    }else{
        self.rightIconV.hidden = YES;
    }
}

/**
 设置左侧图标是否展示
 */
- (void)setShowIcon:(BOOL)showIcon {
    _showIcon = showIcon;
    if (showIcon) {
        self.iconV.hidden = NO;
        CGFloat width = self.dataModel.settingStyle.leftIconSize.width;CGFloat height = self.dataModel.settingStyle.leftIconSize.height;
        if (self.dataModel.settingStyle.leftIconRadius) {
            self.iconV.layer.cornerRadius = self.dataModel.settingStyle.leftIconRadius;
        }
        if (self.dataModel.settingStyle.rightIconRadius) {
            self.iconV.layer.cornerRadius = self.dataModel.settingStyle.rightIconRadius;
        }
        [self.iconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(self.dataModel.settingStyle.cellContentLeftMargin);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        CGFloat margin = self.dataModel.settingStyle.leftTitleToLeftIconMargin > 0 ? self.dataModel.settingStyle.leftTitleToLeftIconMargin : BLSettingBaseMargin;
        [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconV.mas_right).offset(margin);
        }];
    }else{
        self.iconV.hidden = YES;
        [self.iconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(self.dataModel.settingStyle.cellContentLeftMargin);
            make.width.height.mas_equalTo(0);
        }];
        [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconV.mas_right).offset(0);
        }];
    }
}

/**
 设置箭头是否显示
 */
- (void)setShowArrow:(BOOL)showArrow {
    _showArrow = showArrow;
    if (showArrow) {
        _arrowV.hidden = NO;
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
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        CGFloat margin = self.dataModel.settingStyle.rightIconToRightArrowMargin > 0 ? self.dataModel.settingStyle.rightIconToRightArrowMargin : BLSettingBaseMargin;
        [_rightIconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left).offset(-margin);
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

@end
