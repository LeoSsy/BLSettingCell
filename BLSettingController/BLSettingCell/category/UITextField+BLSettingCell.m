//
//  UITextField+BLSettingCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/23.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "UITextField+BLSettingCell.h"
#import <objc/runtime.h>

static const char textFieldSettingIndexPathKey = '\0';

@implementation UITextField (BLSettingCell)

- (void)setSettingModel:(BLSettingModel *)settingModel {
    objc_setAssociatedObject(self, &textFieldSettingIndexPathKey, settingModel, OBJC_ASSOCIATION_ASSIGN);
}

- (BLSettingModel *)settingModel {
    return  objc_getAssociatedObject(self, &textFieldSettingIndexPathKey);
}

@end
