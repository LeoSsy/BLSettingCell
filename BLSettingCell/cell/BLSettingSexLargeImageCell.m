//
//  BLSettingSexLargeImageCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/21.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingSexLargeImageCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface BLSettingSexLargeImageCell()
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@end

@implementation BLSettingSexLargeImageCell

- (void)buildSubview {
    [super buildSubview];
    _leftBtn= [[UIButton alloc] init];
    [_leftBtn addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _leftBtn.showsTouchWhenHighlighted = NO;
    [self.contentView addSubview:_leftBtn];
    
    _rightBtn= [[UIButton alloc] init];
    [_rightBtn addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _rightBtn.showsTouchWhenHighlighted = NO;
    [self.contentView addSubview:_rightBtn];
    
}

- (void)sexBtnClick:(UIButton*)btn{
    if (btn == self.leftBtn) {
        self.leftBtn.selected = YES;
        self.rightBtn.selected = NO;
    }else{
        self.leftBtn.selected = NO;
        self.rightBtn.selected = YES;
    }
    if (self.dataModel.sexOperation) {
        self.dataModel.sexSelType((btn==self.leftBtn)?BLSettingSexSelectTypeLeft:BLSettingSexSelectTypeRight);
        self.dataModel.sexOperation(self.dataModel,self.dataModel.sexSelectType);
    }
}

- (void)configModel:(BLSettingModel *)dataModel {
    if (!dataModel)  return;
    [super configModel:dataModel];
    
    [self.leftBtn setImage:[UIImage imageNamed:dataModel.sexLeftNormalImage] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:dataModel.sexLeftSelectedImage] forState:UIControlStateSelected];
    
    [self.rightBtn setImage:[UIImage imageNamed:dataModel.sexRightNormalImage] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:dataModel.sexRightSelectedImage] forState:UIControlStateSelected];
    
    [_rightBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_centerX).offset(self.dataModel.settingStyle.sexLargeImageMargin*0.5);
        make.width.mas_equalTo(self.dataModel.settingStyle.leftIconSize.width);
        make.height.mas_equalTo(self.dataModel.settingStyle.leftIconSize.height);
    }];
    
    [_leftBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_centerX).offset(-self.dataModel.settingStyle.sexLargeImageMargin*0.5);
        make.width.mas_equalTo(self.dataModel.settingStyle.rightIconSize.width);
        make.height.mas_equalTo(self.dataModel.settingStyle.rightIconSize.height);
    }];
    
    if (dataModel.sexSelectType == BLSettingSexSelectTypeLeft) {
        self.leftBtn.selected = YES;
        self.rightBtn.selected = NO;
    }else if (dataModel.sexSelectType == BLSettingSexSelectTypeRight) {
        self.leftBtn.selected = NO;
        self.rightBtn.selected = YES;
    }else{
        self.leftBtn.selected = NO;
        self.rightBtn.selected = NO;
    }
}
- (void)setFrameSubview {
    [super setFrameSubview];
    
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_centerX).offset(self.dataModel.settingStyle.sexLargeImageMargin*0.5);
        make.centerY.equalTo(self.contentView).offset(-self.dataModel.settingStyle.underlineHeight*0.5);
        make.width.mas_equalTo(self.dataModel.settingStyle.leftIconSize.width);
        make.height.mas_equalTo(self.dataModel.settingStyle.leftIconSize.height);

    }];
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_centerX).offset(-self.dataModel.settingStyle.sexLargeImageMargin*0.5);
        make.centerY.equalTo(self.contentView).offset(-self.dataModel.settingStyle.underlineHeight*0.5);
        make.width.mas_equalTo(self.dataModel.settingStyle.rightIconSize.width);
        make.height.mas_equalTo(self.dataModel.settingStyle.rightIconSize.height);
    }];
    
}


@end
