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
    _segumentV.selectedSegmentIndex = self.dataModel.selectIndex;
    _segumentV.tintColor = self.dataModel.settingStyle.segumentTintColor;
    _segumentV.apportionsSegmentWidthsByContent = YES;
    [self.contentView addSubview:_segumentV];
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    
    [_segumentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
        make.centerY.equalTo(self.titleL);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(0.5);
    }];
    
}

- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    [super configModel:dataModel];
    _segumentV.tintColor = self.dataModel.settingStyle.segumentTintColor;
    if (dataModel.segumentTitleArr) {
        [self.segumentV removeAllSegments];
        for (NSUInteger i =0 ; i<dataModel.segumentTitleArr.count  ; i++ ) {
            [self.segumentV insertSegmentWithTitle:dataModel.segumentTitleArr[i] atIndex:i animated:NO];
        }
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
    
    if (dataModel.settingStyle.isSegumentClearRadius) {
        [self clearSegumentRadius];
    }else{
        [self resentSegumentRadius];
    }
    
    if (dataModel.settingStyle.isSegumentClearDivider) {
        UIColor *color =   [UIColor clearColor];
        [self.segumentV setDividerImage:[self createImageWithColor:color] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self.segumentV setDividerImage:[self createImageWithColor:color] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }else{
        [self.segumentV setDividerImage:nil forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self.segumentV setDividerImage:nil forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    if (dataModel.settingStyle.segItemW) {
        [_segumentV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
            make.centerY.equalTo(self.contentView);
            make.width.mas_equalTo(dataModel.settingStyle.segItemW*dataModel.segumentTitleArr.count);
            make.height.equalTo(self.contentView.mas_height).multipliedBy(0.5);
        }];
    }else{
        [_segumentV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
            make.centerY.equalTo(self.contentView);
            make.height.equalTo(self.contentView.mas_height).multipliedBy(0.5);
        }];
    }
    
    [_segumentV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
    }];
}

- (void)clearSegumentRadius {
    self.segumentV.layer.borderWidth = self.dataModel.settingStyle.segBorderWidth > 0 ? self.dataModel.settingStyle.segBorderWidth:1 ;
    self.segumentV.layer.borderColor = self.segumentV.tintColor.CGColor;
    if (self.dataModel.settingStyle.segNormalTextStyle) {
        [self.segumentV setTitleTextAttributes:self.dataModel.settingStyle.segNormalTextStyle forState:UIControlStateNormal];
    }else{
        NSDictionary* unselectedTextAttributes =
        @{
          NSFontAttributeName:[UIFont systemFontOfSize:13],
          NSForegroundColorAttributeName: self.segumentV.tintColor
          };
        [self.segumentV setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    }
    if (self.dataModel.settingStyle.segSelectedTextStyle) {
        [self.segumentV setTitleTextAttributes:self.dataModel.settingStyle.segSelectedTextStyle forState:UIControlStateSelected];
    }else{
        NSDictionary* selectedTextAttributes =
        @{
          NSFontAttributeName:[UIFont systemFontOfSize:13],
          NSForegroundColorAttributeName: [UIColor whiteColor]
          };
        [self.segumentV setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    }
    [self.segumentV setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segumentV setBackgroundImage:[self createImageWithColor:self.segumentV.tintColor] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
}

- (void)resentSegumentRadius {
    self.segumentV.layer.borderWidth = 0;
    self.segumentV.layer.borderColor = self.segumentV.tintColor.CGColor;
    [self.segumentV setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segumentV setBackgroundImage:nil forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    if (self.dataModel.settingStyle.segNormalTextStyle) {
        [self.segumentV setTitleTextAttributes:self.dataModel.settingStyle.segNormalTextStyle forState:UIControlStateNormal];
    }else{
        [self.segumentV setTitleTextAttributes:nil forState:UIControlStateNormal];
    }
    if (self.dataModel.settingStyle.segSelectedTextStyle) {
        [self.segumentV setTitleTextAttributes:self.dataModel.settingStyle.segSelectedTextStyle forState:UIControlStateSelected];
    }else{
        [self.segumentV setTitleTextAttributes:nil forState:UIControlStateSelected];//设置文字属性
    }
}

#pragma mark event
/**
 segument被点击了
 */
- (void)segumentChanged:(UISegmentedControl *)seg {
    if (!self.dataModel) return;
    self.dataModel.segumentSelIndex([seg selectedSegmentIndex]);
    if (self.dataModel.cellSegumentOperation) {
        self.dataModel.cellSegumentOperation(self.dataModel,self.dataModel.segumentTitleArr, [seg selectedSegmentIndex]);
    }
}

- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

