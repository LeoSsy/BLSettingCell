//
//  BLSettingBaseCell.h
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLSettingConst.h"
#import "BLSettingModel.h"
#import "BLSettingFactory.h"

@interface BLSettingBaseCell : UITableViewCell
/**设置模型*/
@property(nonatomic,strong)BLSettingModel *dataModel;
/**标题*/
@property(nonatomic,readonly,strong)UILabel *titleL;
/**左侧图标*/
@property(nonatomic,readonly,strong)UIImageView *iconV;
/**下划线*/
@property(nonatomic,readonly,strong)UIView *underline;
/**
 初始化
 @param tableView tableView
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 初始化带参数
 @param tableView tableView
 @param data 数据源
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView withData:(id)data;

#pragma mark - Useful method.
/**
 设置模型数据
 */
- (void)configModel:(BLSettingModel *)dataModel;

/**
 *  系统cell的设置 可设置背景颜色 点击变灰效果等
 */
- (void)setupCell;

/**
 *  创建子视图 默认会创建左侧图标和标题
 */
- (void)buildSubview;

/**
 完全创建自定义子视图 默认不会创建任何子控件 所有子控件需要子类去做
 */
- (void)buildNewSubview;

/**
 *  布局子视图
 */
-(void)setFrameSubview;

/**
 布局自定义子视图 和 buildNewSubview配套使用
 */
- (void)setFrameNewSubview;

#pragma mark event
/**
 cell被点击了
 */
- (void)cellClicked;

@end
