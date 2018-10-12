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
/**左侧图标 默认图标视图是隐藏 如果传入nil 也会隐藏*/
@property(nonatomic,strong)UIImage *leftIconName;
/**左侧标题*/
@property(nonatomic,strong)NSString *title;
/**右侧标题*/
@property(nonatomic,strong)NSString *desc;
/**箭头图标*/
@property(nonatomic,strong)UIImage *arrowName;
/**是否显示小红点*/
@property(nonatomic,assign)BOOL showReadPoint;
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
    _descL.textAlignment = NSTextAlignmentRight;
    [ self.contentView addSubview:_descL];

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
        
    [_descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowV.mas_left).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.titleL);
    }];
    
    [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_lessThanOrEqualTo(self.descL.mas_left).offset(-BLSettingBaseMargin);
    }];
}

/**
 设置数据模型
 @param dataModel 数据模型
 */
- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    [super configModel:dataModel];
    //箭头设置
    self.showArrow = dataModel.isShowArrow;
    //设置文字
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
        
        CGFloat margin = self.dataModel.settingStyle.rightDescToRightArrowMargin != 0 ? self.dataModel.settingStyle.rightDescToRightArrowMargin : -BLSettingBaseMargin;
        [_descL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left).offset(margin);
        }];
    }else{
        _arrowV.hidden = YES;
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
            make.width.height.mas_equalTo(0);
        }];
        
        [_descL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left);
        }];
    }
}

@end
