//
//  BLSettingBaseCell.m
//  BLSettingController
//
//  Created by Jack on 2018/8/1.
//  Copyright © 2018年 bianla. All rights reserved.
//
#import "BLSettingBaseCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface BLSettingBaseCell()
/**是否显示左侧图标 默认不显示*/
@property(nonatomic,assign)BOOL showIcon;
/**icon上面的小红点*/
@property(nonatomic,strong)UIView *redPointV;
@end

@implementation BLSettingBaseCell

/**
 快速初始化cell
 @param tableView tableView
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return [self cellWithTableView:tableView withData:nil];
}

/**
 快速初始化cell
 @param tableView tableView
 @param data 数据对象,根据传入的不同数据创建不同的标示
 @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView withData:(id)data {
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    BLSettingBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:[self getReuseID]];
    if (!cell) {cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self getReuseID] withData:data];}
    return cell;
}

/**
 快速初始化cell
 @param style 系统cell样式
 @param reuseIdentifier 重用标识
 @return cell
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withData:(id)data {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.dataModel = data;
    [self setupCell];
    [self buildSubview];
    [self setFrameSubview];
    return self;
}

/**
 获取对应类型的标识
 */
+ (NSString *)getReuseID{
    return NSStringFromClass([self class]);
}

/**
 *  系统cell的设置 可设置背景颜色 点击变灰效果等
 */
- (void)setupCell {
    self.contentView.backgroundColor = [UIColor whiteColor];
    //判断是否有点击事件
    if (self.dataModel.cellOperationBlock) {
        [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellClicked)]];
    }
}

/**
 设置模型数据
 */
- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    self.dataModel = dataModel;
    if (dataModel.iconImageName) {    //设置左侧图标
        self.showIcon = YES;
        self.redPointV.hidden = !dataModel.isShowRedPoint;
        if ([dataModel.iconImageName hasPrefix:@"http://"] || [dataModel.iconImageName hasPrefix:@"https://"] ) {
            [self.iconV sd_setImageWithURL:[NSURL URLWithString:dataModel.iconImageName] placeholderImage:nil options:0];
        }else{
            self.iconV.image = [UIImage imageNamed:dataModel.iconImageName];
        }
    }else{
        self.redPointV.hidden = YES;//如果没有左侧图标就不现实红色圆点
        self.showIcon = NO;
    }
    if (dataModel.title) {
        self.titleL.text = dataModel.title;
    }else if (dataModel.titleAttributeString){
        self.titleL.attributedText = dataModel.titleAttributeString;
    }
    self.underline.hidden = !dataModel.isShowUnderLine;
    self.underline.backgroundColor = self.dataModel.settingStyle.underlineColor;

    _titleL.font = self.dataModel.settingStyle.titleFont;
    _titleL.textColor = self.dataModel.settingStyle.titleColor;
    _redPointV.backgroundColor = self.dataModel.settingStyle.redDotColor;
}

/**
 设置左侧图标是否展示
 */
- (void)setShowIcon:(BOOL)showIcon {
    _showIcon = showIcon;
    if (showIcon) {
        self.iconV.hidden = NO;
        CGFloat width = self.dataModel.settingStyle.leftIconSize.width;CGFloat height = self.dataModel.settingStyle.leftIconSize.height;
        if (self.dataModel.settingStyle.leftIconNeedRadius) {
            self.iconV.layer.cornerRadius = width*0.5;
        }
        [self.iconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconV.mas_right).offset(BLSettingBaseMargin);
        }];
    }else{
        self.iconV.hidden = YES;
        [self.iconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(0);
        }];
        [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconV.mas_right);
        }];
    }
}

/**
布局子视图
 */
- (void)buildSubview {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _iconV = [[UIImageView alloc] init];
    _iconV.contentMode = UIViewContentModeScaleAspectFill;
    [ self.contentView addSubview:_iconV];

    _titleL = [[UILabel alloc] init];
    _titleL.font = self.dataModel.settingStyle.titleFont;
    _titleL.textColor = self.dataModel.settingStyle.titleColor;
    [self.contentView addSubview:_titleL];
    
    _redPointV = [[UIView alloc] init];
    _redPointV.backgroundColor = self.dataModel.settingStyle.redDotColor;
    _redPointV.hidden = YES;
    _redPointV.layer.cornerRadius = self.dataModel.settingStyle.redDotSize*0.5;;
    [self.contentView addSubview:_redPointV];
    
    UIView *underline = [[UIView alloc] init];
    underline.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:underline];
    self.underline = underline;
  
}

/**
 完全布局子视图
 */
- (void)buildNewSubview {
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

/**
 *  布局子视图
 */
- (void)setFrameSubview {
    [_iconV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0);
        make.height.mas_equalTo(0);
        make.left.equalTo(self.contentView).offset(BLSettingBaseMargin);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconV.mas_right).offset(0);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_redPointV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconV.mas_right).offset(-self.dataModel.settingStyle.redDotSize*0.5);
        make.centerY.equalTo(self.iconV.mas_top).offset(self.dataModel.settingStyle.redDotSize*0.4);
        make.width.height.mas_equalTo(self.dataModel.settingStyle.redDotSize);
    }];
    
    [self.underline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).insets(self.dataModel.settingStyle.cellLineEdgeInsets);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(self.dataModel.settingStyle.underlineHeight);
    }];
}

/**
 布局自定义子视图 和 buildNewSubview配套使用
 */
- (void)setFrameNewSubview {}

#pragma mark event
/**
 cell被点击了
 */
- (void)cellClicked {
    if (!self.dataModel) return;
    if (self.dataModel.cellOperationBlock) {
        self.dataModel.cellOperationBlock(self.dataModel);
    }
}

@end
