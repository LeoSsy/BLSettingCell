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
    
    //判断是否有点击事件
    if (self.dataModel.cellClickOperation) {
        [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellClicked)]];
    }
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_arrowV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentLeftMargin);
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
    
    //清空数据
    self.rightIconV.image = nil;
    
    //设置数据
    if (dataModel.rightImageObj) {
        self.rightIconV.image = dataModel.rightImageObj;
    }else{
        if (dataModel.rightImageName) {
            if ([dataModel.rightImageName hasPrefix:@"http://"] || [dataModel.rightImageName hasPrefix:@"https://"] ) {
                [self.rightIconV sd_setImageWithURL:[NSURL URLWithString:dataModel.rightImageName] placeholderImage:nil options:0];
            }else{
                self.rightIconV.image = [UIImage imageNamed:dataModel.rightImageName];
            }
        }
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
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        [_rightIconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowV.mas_left).offset(-BLSettingBaseMargin);
        }];
    }else{
        _arrowV.hidden = YES;
        [_arrowV mas_updateConstraints:^(MASConstraintMaker *make) {
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
    if (!self.dataModel) return;
    if (self.dataModel.cellClickOperation) {
        self.dataModel.cellClickOperation(self.dataModel);
    }
}
@end
