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
/**新功能提示的小红点*/
@property(nonatomic,strong)UIView *redPointV;
/**新功能提示文本视图*/
@property(nonatomic,strong)UILabel *featureHintL;
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
    if (self.dataModel.cellClickOperation) {
        [self.contentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellClicked)]];
    }
}

/**
 设置模型数据
 */
- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    self.dataModel = dataModel;
     //设置左侧图标
    if (dataModel.leftImageObj) {
        self.iconV.image = dataModel.leftImageObj;
        self.showIcon = YES;
    }else if (dataModel.leftImageName){
        self.showIcon = YES;
        if ([dataModel.leftImageName hasPrefix:@"http://"] || [dataModel.leftImageName hasPrefix:@"https://"] ) {
            UIImage *placeImage = dataModel.leftIconPlaceholderName ?  [UIImage imageNamed:dataModel.leftIconPlaceholderName] : nil;
            [self.iconV sd_setImageWithURL:[NSURL URLWithString:dataModel.leftImageName] placeholderImage:placeImage options:0];
        }else{
            self.iconV.image = [UIImage imageNamed:dataModel.leftImageName];
        }
    }else if (dataModel.leftNormalImageName || dataModel.leftSelectedImageName){
        self.showIcon = YES;
        if (dataModel.cellSelected) {
            self.iconV.image = [UIImage imageNamed:dataModel.leftSelectedImageName];
        }else{
            self.iconV.image = [UIImage imageNamed:dataModel.leftNormalImageName];
        }
    }else{
        self.iconV.image = nil;
        self.showIcon = NO;
    }

    if (dataModel.title) {
        self.titleL.text = dataModel.title;
        self.titleL.textColor = self.dataModel.settingStyle.titleColor;
        if (dataModel.settingStyle.titleFont) {
            self.titleL.font = dataModel.settingStyle.titleFont;
        }else if(dataModel.settingStyle.titleFontSize){
            self.titleL.font = [UIFont systemFontOfSize:dataModel.settingStyle.titleFontSize];
        }
    }else if (dataModel.titleAttributeString){
        self.titleL.attributedText = dataModel.titleAttributeString;
    }else{
        self.titleL.text = nil;
    }
    self.underline.hidden = !dataModel.isShowUnderLine;
    self.underline.backgroundColor = self.dataModel.settingStyle.underlineColor;

    if (dataModel.hintType == BLSettingNewFeatureHintTypeText) { //文本类型
        self.featureHintL.hidden = NO;
        self.redPointV.hidden = YES;
        self.featureHintL.backgroundColor = self.dataModel.settingStyle.hintBgColor;
        self.featureHintL.textColor = self.dataModel.settingStyle.hintColor;
        self.featureHintL.font = self.dataModel.settingStyle.hintFont;
        self.featureHintL.text = self.dataModel.hintString;
        self.featureHintL.layer.cornerRadius = self.dataModel.settingStyle.hintVRadius;
        self.featureHintL.layer.masksToBounds = YES;
        [_featureHintL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.dataModel.settingStyle.hintViewWH.width);
            make.height.mas_equalTo(self.dataModel.settingStyle.hintViewWH.height);
        }];
    }else if (dataModel.hintType == BLSettingNewFeatureHintTypeTextRedDot){//小红点类型
        self.featureHintL.hidden = YES;
        self.redPointV.hidden = NO;
        self.redPointV.backgroundColor = self.dataModel.settingStyle.redDotColor;
    }else{
        self.featureHintL.hidden = YES;
        self.redPointV.hidden = YES;
    }
    
    //设置cell点击样式
    self.selectionStyle = dataModel.settingStyle.selectionStyle;
}

/**
 设置左侧图标是否展示
 */
- (void)setShowIcon:(BOOL)showIcon {
    _showIcon = showIcon;
    if (showIcon) {
        self.iconV.hidden = NO;
        CGFloat width = self.dataModel.settingStyle.leftIconSize.width;CGFloat height = self.dataModel.settingStyle.leftIconSize.height;
        if (self.dataModel.settingStyle.leftIconRadius) {
            self.iconV.layer.cornerRadius = self.dataModel.settingStyle.leftIconRadius;
        }
        [self.iconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(self.dataModel.settingStyle.cellContentLeftMargin);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
        
        CGFloat margin = self.dataModel.settingStyle.leftTitleToLeftIconMargin != 0 ? self.dataModel.settingStyle.leftTitleToLeftIconMargin : BLSettingBaseMargin;
        [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconV.mas_right).offset(margin);
        }];
    }else{
        self.iconV.hidden = YES;
        [self.iconV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(self.dataModel.settingStyle.cellContentLeftMargin);
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
    
    _featureHintL = [[UILabel alloc] init];
    _featureHintL.textAlignment = NSTextAlignmentCenter;
    _featureHintL.layer.masksToBounds = YES;
    [self.contentView addSubview:_featureHintL];
    
    _underline = [[UIView alloc] init];
    [self.contentView addSubview:_underline];  
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
        make.left.equalTo(self.contentView).offset(self.dataModel.settingStyle.cellContentLeftMargin);
        make.centerY.equalTo(self.contentView).offset(-self.dataModel.settingStyle.underlineHeight*0.5);
    }];
    
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconV.mas_right).offset(0);
        make.centerY.equalTo(self.contentView).offset(-self.dataModel.settingStyle.underlineHeight*0.5);
    }];
    
    [_redPointV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_right).offset(2);
        make.centerY.equalTo(self.titleL.mas_top).offset(self.dataModel.settingStyle.redDotSize*0.4);
        make.width.height.mas_equalTo(self.dataModel.settingStyle.redDotSize);
    }];
    
    [_featureHintL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_right).offset(5);
        make.centerY.equalTo(self.titleL);
        make.width.mas_equalTo(self.dataModel.settingStyle.hintViewWH.width);
        make.height.mas_equalTo(self.dataModel.settingStyle.hintViewWH.height);
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
    if (self.dataModel.cellClickOperation) {
        self.dataModel.cellClickOperation(self.dataModel);
    }
    self.dataModel.cellSelected = !self.dataModel.cellSelected;
    //设置图标状态
    if (self.dataModel.leftNormalImageName || self.dataModel.leftSelectedImageName){
        self.showIcon = YES;
        if (self.dataModel.cellSelected) {
            self.iconV.image = [UIImage imageNamed:self.dataModel.leftSelectedImageName];
        }else{
            self.iconV.image = [UIImage imageNamed:self.dataModel.leftNormalImageName];
        }
    }
}

@end
