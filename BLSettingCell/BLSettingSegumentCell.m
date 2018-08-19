//
//  BLSettingSegumentCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingSegumentCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface BLSettingSegumentCell()
/**右边的segument*/
@property(nonatomic,strong)UISegmentedControl *segumentV;
@end

@implementation BLSettingSegumentCell

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    _segumentV = [[UISegmentedControl alloc] initWithItems:self.dataModel.segumentTitleArr];
    [_segumentV addTarget:self action:@selector(segumentChanged:) forControlEvents:UIControlEventValueChanged];
    _segumentV.selectedSegmentIndex = 0;
    _segumentV.tintColor = self.dataModel.settingStyle.segumentTintColor;
    [self.contentView addSubview:_segumentV];
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    [_segumentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-BLSettingBaseMargin);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(BLSettingBaseSegumentW);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(0.5);
    }];
}

- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    [super configModel:dataModel];
    _segumentV.tintColor = self.dataModel.settingStyle.segumentTintColor;
    if (dataModel.segumentTitleArr) {
        if (dataModel.selectIndex >= 0 && dataModel.selectIndex < dataModel.segumentTitleArr.count) {
            [self.segumentV setSelectedSegmentIndex:dataModel.selectIndex];
        }
    }
    if (dataModel.settingStyle.segNormalTextStyle) {
        [self.segumentV setTitleTextAttributes:dataModel.settingStyle.segNormalTextStyle forState:UIControlStateNormal];
    }
    if (dataModel.settingStyle.segSelectedTextStyle) {
        [self.segumentV setTitleTextAttributes:dataModel.settingStyle.segSelectedTextStyle forState:UIControlStateSelected];
    }
}

#pragma mark event
/**
 segument被点击了
 */
- (void)segumentChanged:(UISegmentedControl *)seg {
    if (!self.dataModel) return;
    self.dataModel.selIndex([seg selectedSegmentIndex]);
    if (self.dataModel.cellSegumentBlock) {
        self.dataModel.cellSegumentBlock(self.dataModel,self.dataModel.segumentTitleArr, [seg selectedSegmentIndex]);
    }
}

@end
