//
//  BLSettingCell.h
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingBaseCell.h"

@class BLSettingModel;

@interface BLSettingNormalCell : BLSettingBaseCell
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
@end
