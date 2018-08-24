//
//  BLSettingSexCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/20.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingSexCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface BLSettingSexCell()
@property(nonatomic,strong)UIButton *sexBtn1;
@property(nonatomic,strong)UIButton *sexBtn2;
@end

@implementation BLSettingSexCell

- (void)buildSubview {
    [super buildSubview];
    _sexBtn1= [[UIButton alloc] init];
    [_sexBtn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _sexBtn1.titleLabel.font = [UIFont systemFontOfSize:13];
    [_sexBtn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
    [_sexBtn1 addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_sexBtn1];
    
    _sexBtn2= [[UIButton alloc] init];
    [_sexBtn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _sexBtn2.titleLabel.font = [UIFont systemFontOfSize:13];
    [_sexBtn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
    [_sexBtn2 addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_sexBtn2];
    
}

- (void)sexBtnClick:(UIButton*)btn{
    if (btn == self.sexBtn1) {
        self.sexBtn1.selected = YES;
        self.sexBtn2.selected = NO;
    }else{
        self.sexBtn1.selected = NO;
        self.sexBtn2.selected = YES;
    }
    if (self.dataModel.sexOperation) {
        self.dataModel.sexSelType((btn==self.sexBtn1)?BLSettingSexSelectTypeLeft:BLSettingSexSelectTypeRight);
        self.dataModel.sexOperation(self.dataModel,self.dataModel.sexSelectType);
    }
}

- (void)configModel:(BLSettingModel *)dataModel {
    if (!dataModel)  return;
    [super configModel:dataModel];
    
    [self.sexBtn1 setImage:[UIImage imageNamed:dataModel.sexLeftNormalImage] forState:UIControlStateNormal];
    [self.sexBtn1 setImage:[UIImage imageNamed:dataModel.sexLeftSelectedImage] forState:UIControlStateSelected];

    [self.sexBtn2 setImage:[UIImage imageNamed:dataModel.sexRightNormalImage] forState:UIControlStateNormal];
    [self.sexBtn2 setImage:[UIImage imageNamed:dataModel.sexRightSelectedImage] forState:UIControlStateSelected];

    [self.sexBtn1 setTitle:dataModel.sexLeftTitle forState:UIControlStateNormal];
    [self.sexBtn2 setTitle:dataModel.sexRightTitle forState:UIControlStateNormal];
    
    [self.sexBtn1 setTitleColor:dataModel.settingStyle.sexLeftTitleNormalColor forState:UIControlStateNormal];
    [self.sexBtn1 setTitleColor:dataModel.settingStyle.sexLeftTitleSelectedColor forState:UIControlStateSelected];
    
    [self.sexBtn2 setTitleColor:dataModel.settingStyle.sexRightTitleNormalColor forState:UIControlStateNormal];
    [self.sexBtn2 setTitleColor:dataModel.settingStyle.sexRightTitleSelectedColor forState:UIControlStateSelected];
    
    self.sexBtn1.titleLabel.font = dataModel.settingStyle.sexLeftTitleFont;
    self.sexBtn2.titleLabel.font = dataModel.settingStyle.sexRightTitleFont;

    [_sexBtn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, dataModel.settingStyle.sexLeftTitleLeftMargin?dataModel.settingStyle.sexLeftTitleLeftMargin:15, 0, 0)];
    [_sexBtn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, dataModel.settingStyle.sexRightTitleLeftMargin?dataModel.settingStyle.sexRightTitleLeftMargin:15, 0, 0)];
    
    if (dataModel.settingStyle.sexLeftViewWidth) {
        [_sexBtn1 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(dataModel.settingStyle.sexLeftViewWidth);
        }];
    }
    
    if (dataModel.settingStyle.sexRightViewWidth) {
        [_sexBtn2 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(dataModel.settingStyle.sexRightViewWidth);
        }];
    }
    
    if (dataModel.sexSelectType == BLSettingSexSelectTypeLeft) {
        self.sexBtn1.selected = YES;
        self.sexBtn2.selected = NO;
    }else if (dataModel.sexSelectType == BLSettingSexSelectTypeRight) {
        self.sexBtn1.selected = NO;
        self.sexBtn2.selected = YES;
    }else{
        self.sexBtn1.selected = NO;
        self.sexBtn2.selected = NO;
    }
    
    [_sexBtn2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
    }];
}

- (void)setFrameSubview {
    [super setFrameSubview];
 
    [_sexBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
        make.width.mas_equalTo(self.dataModel.settingStyle.sexLeftViewWidth);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.underline.mas_top);
    }];
    
    [_sexBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_sexBtn2.mas_left).offset(0);
        make.width.mas_equalTo(self.dataModel.settingStyle.sexRightViewWidth);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.underline.mas_top);
    }];
    
}


@end
