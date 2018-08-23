//
//  UITextField+BLSettingCell.h
//  BLSettingController
//
//  Created by Jack on 2018/8/23.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLSettingModel.h"

@interface UITextField (BLSettingCell)
/**
 当UITextField放在tableviewCell里面的时候保存此属性解决循环利用的问题
 */
@property(nonatomic,strong)BLSettingModel *settingModel;
@end
