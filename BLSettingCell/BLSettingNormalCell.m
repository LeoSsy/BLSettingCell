//
//  BLSettingCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingNormalCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface BLSettingNormalCell()
/**右边的标题*/
@property(nonatomic,strong)UILabel *descL;
/**右边的箭头*/
@property(nonatomic,strong)UIImageView *arrowV;
/**是否显示箭头 默认显示*/
@property(nonatomic,assign)BOOL showArrow;
@end

@implementation BLSettingNormalCell

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    _descL = [[UILabel alloc] init];
    _descL.font = self.dataModel.settingStyle.descFont;
    _descL.textColor = self.dataModel.settingStyle.descColor;
    _descL.textAlignment = NSTextAlignmentRight;
    [ self.contentView addSubview:_descL];
    
    _arrowV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.dataModel.arrowImageName]];
    [ self.contentView addSubview:_arrowV];
     
}

/**
 布局控件
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
        
    [_descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowV.mas_left).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.titleL.mas_right);
    }];
}

/**
 设置数据模型
 @param dataModel 数据模型
 */
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
    if (dataModel.detailTitle) {
        self.descL.text = dataModel.detailTitle;
    }else if (dataModel.detailAttributeString){
        self.descL.attributedText = dataModel.detailAttributeString;
    }
}

/**
 设置箭头是否显示
 */
- (void)setShowArrow:(BOOL)showArrow {
    _showArrow = showArrow;
    if (showArrow) {
        _arrowV.hidden = NO;
        CGFloat width = 12;
        CGFloat height = 12;
        if (self.arrowName) {
            width = self.arrowName.size.width;
            height = self.arrowName.size.height;
        }
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        [_descL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left).offset(-BLSettingBaseMargin);
        }];
    }else{
        _arrowV.hidden = YES;
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(0);
        }];
        
        [_descL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left);
        }];
    }
}

@end
