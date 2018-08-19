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
/**右边的箭头*/
@property(nonatomic,strong)UIImageView *arrowV;
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
    
    _arrowV = [[UIImageView alloc] initWithImage:[BLSettingFactory bundleForArrowIcon]];
    [ self.contentView addSubview:_arrowV];
}

/**
 *  布局子视图
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_arrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.contentView);
        CGFloat width = self.dataModel.settingStyle.arrowSize.width;CGFloat height = self.dataModel.settingStyle.arrowSize.height;
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    
    [self.iconV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(BLSettingBaseMargin);
        make.centerY.equalTo(self.contentView);
        CGFloat width = self.dataModel.settingStyle.leftIconSize.width;CGFloat height = self.dataModel.settingStyle.leftIconSize.height;
        if (self.dataModel.settingStyle.rightIconRadius) {
            self.iconV.layer.cornerRadius = self.dataModel.settingStyle.rightIconRadius;
        }
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(height);
    }];
    
    [self.titleL mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconV.mas_right).offset(BLSettingBaseMargin);
        make.height.mas_equalTo(self.titleL.font.pointSize+2);
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-5);
    }];
    
    [_descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleL.mas_bottom).offset(5);
        make.left.equalTo(self.titleL);
    }];
}

/**
 设置数据模型
 @param dataModel 数据模型
 */
- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    if (dataModel.iconImageName) {    //设置左侧图标
        if ([dataModel.iconImageName hasPrefix:@"http://"] || [dataModel.iconImageName hasPrefix:@"https://"] ) {
            [self.iconV sd_setImageWithURL:[NSURL URLWithString:dataModel.iconImageName] placeholderImage:nil options:0];
        }else{
            self.iconV.image = [UIImage imageNamed:dataModel.iconImageName];
        }
    }
    if (dataModel.arrowImageName) {    //设置左侧图标
        self.arrowV.hidden = NO;
        if ([dataModel.arrowImageName hasPrefix:@"http://"] || [dataModel.arrowImageName hasPrefix:@"https://"] ) {
            [self.arrowV sd_setImageWithURL:[NSURL URLWithString:dataModel.arrowImageName] placeholderImage:nil options:0];
        }else{
            self.arrowV.image = [UIImage imageNamed:dataModel.arrowImageName];
        }
    }else{
        self.arrowV.hidden = YES;
    }
    
    self.underline.hidden = !dataModel.isShowUnderLine;
    self.underline.backgroundColor = self.dataModel.settingStyle.underlineColor;

    if (dataModel.title) {
        self.titleL.text = dataModel.title;
    }else if (dataModel.titleAttributeString){
        self.titleL.attributedText = dataModel.titleAttributeString;
    }else{
        self.titleL.text = nil;
    }
    
    if (dataModel.detailTitle) {
        self.descL.text = dataModel.detailTitle;
    }else if (dataModel.detailAttributeString){
        self.descL.attributedText = dataModel.detailAttributeString;
    }else{
        self.descL.text = nil;
    }
    
    if (dataModel.settingStyle.titleFont) {
        _descL.font = dataModel.settingStyle.titleFont;
    }else if(dataModel.settingStyle.titleFontSize){
        _descL.font = [UIFont systemFontOfSize:dataModel.settingStyle.titleFontSize];
    }
    
    if (dataModel.settingStyle.descFont) {
        _descL.font = dataModel.settingStyle.descFont;
    }else if(dataModel.settingStyle.descTitleFontSize){
        _descL.font = [UIFont systemFontOfSize:dataModel.settingStyle.descFontSize];
    }
}

@end
