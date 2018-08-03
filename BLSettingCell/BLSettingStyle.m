//
//  BLSettingStyle.m
//  BLSettingController
//
//  Created by Jack on 2018/8/2.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingStyle.h"
#import "BLSettingConst.h"

@implementation BLSettingStyle

+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor {
    return [[self alloc] initStyleWithTitleFont:titleFont titleColor:titleColor descFont:descFont descColor:descColor switchOnTintColor:nil segumentTintColor:nil];
}

+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor switchOnTintColor:(UIColor*)switchOnTintColor{
    return [[self alloc] initStyleWithTitleFont:titleFont titleColor:titleColor descFont:descFont descColor:descColor switchOnTintColor:switchOnTintColor segumentTintColor:nil];
}

+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor segumentTintColor:(UIColor*)segumentTintColor{
    return [[self alloc] initStyleWithTitleFont:titleFont titleColor:titleColor descFont:descFont descColor:descColor switchOnTintColor:nil segumentTintColor:segumentTintColor];
}

- (instancetype)initStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor switchOnTintColor:(UIColor*)switchOnTintColor segumentTintColor:(UIColor*)segumentTintColor{
    self = [super init];
    [self setupStyle];
    if (titleFont) self.titleFont = titleFont;
    if (titleColor) self.titleColor = titleColor;
    if (descFont) self.descFont = descFont;
    if (descColor) self.descColor = descColor;
    if (switchOnTintColor) self.switchOnTintColor = switchOnTintColor;
    if (segumentTintColor) self.segumentTintColor = segumentTintColor;
    return self;
}

- (instancetype)init {
    self = [super init];
    [self setupStyle];
    return self;
}

- (void)setupStyle {
    
    self.leftIconSize = CGSizeMake(22, 22);
    self.leftIconAddRadius = NO;
    
    self.rightIconSize = self.leftIconSize;
    self.rightIconAddRadius = NO;
    
    self.cellLineEdgeInsets = UIEdgeInsetsZero;
    
    self.underlineColor = BLSETTINGHEXCOLOR(0xe6e7ed);
    self.underlineHeight = 0.5;
    
    self.redDotColor = [UIColor redColor];
    self.redDotSize = 10;
    
    self.arrowSize = CGSizeMake(12, 12);
    
    self.titleFont = [UIFont systemFontOfSize:kBLSettingRatioWithWidth(15)];
    
    self.titleColor = BLSETTINGHEXCOLOR(0x4e4e4e);
    
    self.descFont = [UIFont systemFontOfSize:kBLSettingRatioWithWidth(14)];
    self.descColor = BLSETTINGHEXCOLOR(0x4e4e4e);
    
    self.switchOnTintColor = BLSETTINGHEXCOLOR(0x38c83d);
    
    self.segumentTintColor = BLSETTINGHEXCOLOR(0x38c83d);
}

@end
