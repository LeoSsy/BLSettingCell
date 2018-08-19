//
//  BLSettingModel.m
//  变啦
//
//  Created by Jack on 2018/5/9.
//  Copyright © 2018年 杭州变啦网络科技有限公司. All rights reserved.
//

#import "BLSettingModel.h"

@implementation BLSettingModel
@synthesize type = _type;
@synthesize leftIconName = _leftIconName;
@synthesize rightIconName = _rightIconName;
@synthesize arrowIconName = _arrowIconName;
@synthesize titleText = _titleText;
@synthesize titleAttribute = _titleAttribute;
@synthesize descTitle = _descTitle;
@synthesize descAttribute = _descAttribute;
@synthesize showRedDot = _showRedDot;
@synthesize showIcon = _showIcon;
@synthesize showArrow = _showArrow;
@synthesize showUnderLine = _showUnderLine;
@synthesize cellH = _cellH;
@synthesize style = _style;
@synthesize switchOn = _switchOn;
@synthesize selIndex = _selIndex;
@synthesize segumentTitlesArr = _segumentTitlesArr;
@synthesize cellClikedOperation = _cellClikedOperation;
@synthesize switchOperation = _switchOperation;
@synthesize segumentOperation = _segumentOperation;

@synthesize iconImageName = _iconImageName;
@synthesize rightImageName = _rightImageName;
@synthesize arrowImageName = _arrowImageName;
@synthesize title = _title;
@synthesize titleAttributeString = _titleAttributeString;
@synthesize detailTitle = _detailTitle;
@synthesize detailAttributeString = _detailAttributeString;
@synthesize isShowRedPoint = _isShowRedPoint;
@synthesize isShowIcon = _isShowIcon;
@synthesize isShowArrow = _isShowArrow;
@synthesize isShowUnderLine = _isShowUnderLine;
@synthesize cellType = _cellType;
@synthesize cellHeight = _cellHeight;
@synthesize settingStyle = _settingStyle;
@synthesize switchIsOn = _switchIsOn;
@synthesize selectIndex = _selectIndex;
@synthesize segumentTitleArr = _segumentTitleArr;
@synthesize cellOperationBlock = _cellOperationBlock;
@synthesize cellSwitchBlock = _cellSwitchBlock;
@synthesize cellSegumentBlock = _cellSegumentBlock;

+ (instancetype)model {
    return [[self alloc] init];
}

- (instancetype)initWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle cellType:(BLSettingCellType)cellType selectSwitchArr:(NSArray*)selectSwitchArr selectIndex:(NSInteger)selectIndex isShowIcon:(BOOL)isShowIcon isShowArrow:(BOOL)isShowArrow switchIsOn:(BOOL)switchIsOn rightIcon:(NSString*)rightIconName settingStyle:(BLSettingStyle*)settingStyle {
    if (self = [super init]) {
        _isShowUnderLine = YES;
        _iconImageName = iconName;
        _title =title;
        _cellType = cellType;
        _isShowIcon = isShowIcon;
        _detailTitle = detailTitle;
       _isShowArrow = isShowArrow;
        _switchIsOn = switchIsOn;
        _segumentTitleArr = selectSwitchArr;
        _selectIndex = selectIndex;
        _rightImageName = rightIconName;
        _settingStyle = settingStyle;
    }
    return self;
}

- (DisPlayType)type {
    if (!_type) {
        __weak typeof(self) weakSelf = self;
        _type = ^(BLSettingCellType cellType){
            _cellType = cellType;
            return weakSelf;
        };
    }
    return _type;
}

- (IconNameResource)leftIconName {
    if (!_leftIconName) {
        __weak typeof(self) weakSelf = self;
        _leftIconName = ^(NSString *imageName){
            _iconImageName = imageName;
            return weakSelf;
        };
    }
    return _leftIconName;
}

- (IconNameResource)rightIconName {
    if (!_rightIconName) {
        __weak typeof(self) weakSelf = self;
        _rightIconName = ^(NSString *imageName){
            _rightImageName = imageName;
            return weakSelf;
        };
    }
    return _rightIconName;
}


- (IconNameResource)arrowIconName {
    if (!_arrowIconName) {
        __weak typeof(self) weakSelf = self;
        _arrowIconName = ^(NSString *imageName){
            _arrowImageName = imageName;
            return weakSelf;
        };
    }
    return _arrowIconName;
}


- (Text)titleText {
    if (!_titleText) {
        __weak typeof(self) weakSelf = self;
        _titleText = ^(NSString *text){
            _title = text;
            _titleAttributeString = nil;
            return weakSelf;
        };
    }
    return _titleText;
}

- (TextAttributeString)titleAttribute {
    if (!_titleAttribute) {
        __weak typeof(self) weakSelf = self;
        _titleAttribute = ^(NSAttributedString *attributeText){
            _titleAttributeString = attributeText;
            _title = nil;
            return weakSelf;
        };
    }
    return _titleAttribute;
}

- (Text)descTitle {
    if (!_descTitle) {
        __weak typeof(self) weakSelf = self;
        _descTitle = ^(NSString *text){
            _detailTitle = text;
            _detailAttributeString = nil;
            return weakSelf;
        };
    }
    return _descTitle;
}

- (TextAttributeString)descAttribute {
    if (!_descAttribute) {
        __weak typeof(self) weakSelf = self;
        _descAttribute = ^(NSAttributedString *attributeText){
            _detailAttributeString = attributeText;
            _title = nil;
            return weakSelf;
        };
    }
    return _descAttribute;
}

- (DisPlayStatus)showRedDot {
    if (!_showRedDot) {
        __weak typeof(self) weakSelf = self;
        _showRedDot = ^(BOOL status){
            _isShowRedPoint = status;
            return weakSelf;
        };
    }
    return _showRedDot;
}

- (DisPlayStatus)showIcon {
    if (!_showIcon) {
        __weak typeof(self) weakSelf = self;
        _showIcon = ^(BOOL status){
            _isShowIcon = status;
            return weakSelf;
        };
    }
    return _showIcon;
}

- (DisPlayStatus)showArrow {
    if (!_showArrow) {
        __weak typeof(self) weakSelf = self;
        _showArrow = ^(BOOL status){
            _isShowArrow = status;
            return weakSelf;
        };
    }
    return _showArrow;
}

- (DisPlayStatus)showUnderLine {
    if (!_showUnderLine) {
        __weak typeof(self) weakSelf = self;
        _showUnderLine = ^(BOOL status){
            _isShowUnderLine = status;
            return weakSelf;
        };
    }
    return _showUnderLine;
}

- (DisPlayStatus)switchOn {
    if (!_switchOn) {
        __weak typeof(self) weakSelf = self;
        _switchOn = ^(BOOL status){
            _switchIsOn = status;
            return weakSelf;
        };
    }
    return _switchOn;
}

- (CellHeight)cellH {
    if (!_cellH) {
        __weak typeof(self) weakSelf = self;
        _cellH = ^(CGFloat height){
            _cellHeight = height;
            return weakSelf;
        };
    }
    return _cellH;
}

- (SettingStyle)style {
    if (!_style) {
        __weak typeof(self) weakSelf = self;
        _style = ^(BLSettingStyle *style){
            _settingStyle = style;
            return weakSelf;
        };
    }
    return _style;
}

- (SelectIndex)selIndex {
    if (!_selIndex) {
        __weak typeof(self) weakSelf = self;
        _selIndex = ^(NSInteger index){
            _selectIndex = index;
            return weakSelf;
        };
    }
    return _selIndex;
}

- (SelectSwitchArr)segumentTitlesArr {
    if (!_segumentTitlesArr) {
        __weak typeof(self) weakSelf = self;
        _segumentTitlesArr = ^(NSArray *titleArr){
            _segumentTitleArr = titleArr;
            return weakSelf;
        };
    }
    return _segumentTitlesArr;
}

- (CellClikedOperation)cellClikedOperation {
    if (!_cellClikedOperation) {
        __weak typeof(self) weakSelf = self;
        _cellClikedOperation = ^(cellOperationBlock cellOperationBlock){
            _cellOperationBlock = cellOperationBlock;
            return weakSelf;
        };
    }
    return _cellClikedOperation;
}

- (CellSwitchOperation)switchOperation {
    if (!_switchOperation) {
        __weak typeof(self) weakSelf = self;
        _switchOperation = ^(cellSwitchBlock cellSwitchBlock){
            _cellSwitchBlock = cellSwitchBlock;
            return weakSelf;
        };
    }
    return _switchOperation;
}

- (CellSegumentOperation)segumentOperation {
    if (!_segumentOperation) {
        __weak typeof(self) weakSelf = self;
        _segumentOperation = ^(cellSegumentBlock cellSegumentBlock){
            _cellSegumentBlock = cellSegumentBlock;
            return weakSelf;
        };
    }
    return _segumentOperation;
}

@end

@implementation BLSettingGroup
@end

