//
//  BLSettingStyle.m
//  BLSettingController
//
//  Created by Jack on 2018/8/2.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingStyle.h"
#import "BLSettingConst.h"

@interface BLSettingStyle()

@end

@implementation BLSettingStyle

@synthesize cellSelectionStyle = _cellSelectionStyle;
@synthesize contentLeftMargin = _contentLeftMargin;
@synthesize contentRightMargin = _contentRightMargin;
@synthesize leftImageSize = _leftImageSize;
@synthesize rightImageSize = _rightImageSize;
@synthesize addLeftIconRadius = _addLeftIconRadius;
@synthesize addRightIconRadius = _addRightIconRadius;
@synthesize leftTitleFont = _leftTitleFont;
@synthesize leftTitleFontSize = _leftTitleFontSize;
@synthesize leftTitleColor = _leftTitleColor;
@synthesize descTitleFont = _descTitleFont;
@synthesize descTitleFontSize = _descTitleFontSize;
@synthesize descTitleColor = _descTitleColor;
@synthesize bottomLineColor = _bottomLineColor;
@synthesize bottomLineHeight = _bottomLineHeight;
@synthesize redPointColor = _redPointColor;
@synthesize redPointSize = _redPointSize;
@synthesize arrowIconSize = _arrowIconSize;
@synthesize bottomLineEdgeInsets = _bottomLineEdgeInsets;
@synthesize switchOnColor = _switchOnColor;
@synthesize segumentDrawingColor = _segumentDrawingColor;
@synthesize segumentNormalTextStyle = _segumentNormalTextStyle;
@synthesize segumentSelectedTextStyle = _segumentSelectedTextStyle;
@synthesize textFieldPlaceHolderColor = _textFieldPlaceHolderColor;
@synthesize textFieldPlaceHolderFont = _textFieldPlaceHolderFont;
@synthesize textFieldTextFont = _textFieldTextFont;
@synthesize textFieldTextFontSize = _textFieldTextFontSize;
@synthesize textFieldTextColor = _textFieldTextColor;
@synthesize segumentClearRadius = _segumentClearRadius;
@synthesize segumentBorderWidth = _segumentBorderWidth;
@synthesize segumentClearDivider = _segumentClearDivider;
@synthesize segumentItemW = _segumentItemW;
@synthesize hintTextFont = _hintTextFont;
@synthesize hintTextFontSize = _hintTextFontSize;
@synthesize hintTextColor = _hintTextColor;
@synthesize hintTextBgColor = _hintTextBgColor;
@synthesize hintViewRadius = _hintViewRadius;
@synthesize hintViewSize = _hintViewSize;
@synthesize sexLeftViewStyle = _sexLeftViewStyle;
@synthesize sexRightViewStyle = _sexRightViewStyle;
@synthesize sexLargeImageBothMargin = _sexLargeImageBothMargin;
@synthesize leftTitleSpaceToLeftIconMargin = _leftTitleSpaceToLeftIconMargin;
@synthesize rightDescSpaceToRightArrowMargin = _rightDescSpaceToRightArrowMargin;
@synthesize rightIconSpaceToRightArrowMargin = _rightIconSpaceToRightArrowMargin;
@synthesize avaterTitleSpaceToCellCenterYMargin = _avaterTitleSpaceToCellCenterYMargin;
@synthesize avaterDescSpaceToCellCenterYMargin = _avaterDescSpaceToCellCenterYMargin;
@synthesize subCellTitleSpaceToCellCenterYMargin = _subCellTitleSpaceToCellCenterYMargin;
@synthesize subCellSubTitleSpaceToCellCenterYMargin = _subCellSubTitleSpaceToCellCenterYMargin;

@synthesize selectionStyle = _selectionStyle;
@synthesize cellContentLeftMargin = _cellContentLeftMargin;
@synthesize cellContentRightMargin = _cellContentRightMargin;
@synthesize leftIconSize = _leftIconSize;
@synthesize leftIconRadius = _leftIconRadius;
@synthesize rightIconSize = _rightIconSize;
@synthesize rightIconRadius = _rightIconRadius;
@synthesize titleFont = _titleFont;
@synthesize titleFontSize = _titleFontSize;
@synthesize titleColor = _titleColor;
@synthesize descFont = _descFont;
@synthesize descFontSize = _descFontSize;
@synthesize descColor = _descColor;
@synthesize underlineColor = _underlineColor;
@synthesize underlineHeight = _underlineHeight;
@synthesize redDotColor = _redDotColor;
@synthesize redDotSize = _redDotSize;
@synthesize arrowSize = _arrowSize;
@synthesize cellLineEdgeInsets = _cellLineEdgeInsets;
@synthesize switchOnTintColor = _switchOnTintColor;
@synthesize segumentTintColor = _segumentTintColor;
@synthesize segNormalTextStyle = _segNormalTextStyle;
@synthesize segSelectedTextStyle = _segSelectedTextStyle;
@synthesize textFieldPlaceColor = _textFieldPlaceColor;
@synthesize textFieldPlaceFont = _textFieldPlaceFont;
@synthesize textFieldFont = _textFieldFont;
@synthesize textFieldFontSize = _textFieldFontSize;
@synthesize textFieldColor = _textFieldColor;
@synthesize isSegumentClearRadius = _isSegumentClearRadius;
@synthesize segBorderWidth = _segBorderWidth;
@synthesize isSegumentClearDivider = _isSegumentClearDivider;
@synthesize hintFont = _hintFont;
@synthesize hintFontSize = _hintFontSize;
@synthesize hintColor = _hintColor;
@synthesize hintBgColor = _hintBgColor;
@synthesize hintVRadius = _hintVRadius;
@synthesize hintViewWH = _hintViewWH;
@synthesize sexLeftTitleFont = _sexLeftTitleFont;
@synthesize sexLeftTitleNormalColor = _sexLeftTitleNormalColor;
@synthesize sexLeftTitleSelectedColor = _sexLeftTitleSelectedColor;
@synthesize sexRightTitleFont = _sexRightTitleFont;
@synthesize sexRightTitleNormalColor = _sexRightTitleNormalColor;
@synthesize sexRightTitleSelectedColor = _sexRightTitleSelectedColor;
@synthesize sexLeftTitleLeftMargin = _sexLeftTitleLeftMargin;
@synthesize sexRightTitleLeftMargin = _sexRightTitleLeftMargin;
@synthesize sexLeftViewWidth = _sexLeftViewWidth;
@synthesize sexRightViewWidth = _sexRightViewWidth;
@synthesize sexLargeImageMargin = _sexLargeImageMargin;
@synthesize leftTitleToLeftIconMargin = _leftTitleToLeftIconMargin;
@synthesize rightDescToRightArrowMargin = _rightDescToRightArrowMargin;
@synthesize rightIconToRightArrowMargin = _rightIconToRightArrowMargin;
@synthesize avaterTitleToCellCenterYMargin = _avaterTitleToCellCenterYMargin;
@synthesize avaterDescToCellCenterYMargin = _avaterDescToCellCenterYMargin;
@synthesize subCellTitleToCellCenterYMargin = _subCellTitleToCellCenterYMargin;
@synthesize subCellSubTitleToCellCenterYMargin = _subCellSubTitleToCellCenterYMargin;

+ (BLSettingStyle*)style {
    return [[BLSettingStyle alloc] init];
}

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
    if (titleFont) _titleFont = titleFont;
    if (titleColor) _titleColor = titleColor;
    if (descFont) _descFont = descFont;
    if (descColor) _descColor = descColor;
    if (switchOnTintColor) _switchOnTintColor = switchOnTintColor;
    if (segumentTintColor) _segumentTintColor = segumentTintColor;
    return self;
}

- (instancetype)init {
    self = [super init];
    [self setupStyle];
    return self;
}

- (void)setupStyle {
    
    _cellContentLeftMargin = BLSettingBaseMargin;
    _cellContentRightMargin = BLSettingBaseMargin;

    _leftIconSize = CGSizeMake(30, 30);
    _leftIconRadius =  self.leftIconSize.width*0.5;
    
    _rightIconSize = self.leftIconSize;
    _rightIconRadius =  self.rightIconSize.width*0.5;
    
    _cellLineEdgeInsets = UIEdgeInsetsZero;
    
    _underlineColor = BLSETTINGHEXCOLOR(0xededed);
    _underlineHeight = 0.6;
    
    _redDotColor = [UIColor redColor];
    _redDotSize = 10;
    
    _arrowSize = CGSizeMake(28, 28);
    
    _titleFont = [UIFont systemFontOfSize:14];
    
    _titleColor = BLSETTINGHEXCOLOR(0x333333);
    
    _descFont = [UIFont systemFontOfSize:14];
    _descColor = BLSETTINGHEXCOLOR(0x393939);
    
    _switchOnTintColor = BLSETTINGHEXCOLOR(0x38c83d);
    
    _segumentTintColor = BLSETTINGHEXCOLOR(0x38c83d);
    
    _textFieldPlaceColor = BLSETTINGHEXCOLOR(0x6B6B6B);
    
    _textFieldPlaceFont = [UIFont systemFontOfSize:14];
    
    _textFieldFont = [UIFont systemFontOfSize:14];
    
    _textFieldColor = BLSETTINGHEXCOLOR(0x333333);
    
    _hintFont = [UIFont systemFontOfSize:10];
    
    _hintColor = [UIColor whiteColor];

    _hintBgColor = [UIColor redColor];
    
    _hintViewWH = CGSizeMake(45, 20);
    
    _hintVRadius = _hintViewWH.height *0.5;
    
    _segItemW = 42;
    
    _sexLeftTitleFont =  [UIFont systemFontOfSize:14];
    _sexLeftTitleNormalColor = BLSETTINGHEXCOLOR(0x6B6B6B);
    _sexLeftTitleSelectedColor = BLSETTINGHEXCOLOR(0x333333);
    _sexLeftTitleLeftMargin = 18;
    _sexLeftViewWidth = 55;
    
    _sexRightTitleFont =  [UIFont systemFontOfSize:14];
    _sexRightTitleNormalColor = BLSETTINGHEXCOLOR(0x6B6B6B);
    _sexRightTitleSelectedColor = BLSETTINGHEXCOLOR(0x333333);
    _sexRightTitleLeftMargin = 18;
    _sexRightViewWidth = 55;
    
    _subCellTitleToCellCenterYMargin = 8;
    _subCellSubTitleToCellCenterYMargin = 3;
    
}

- (CellSeporatorStyle)cellSelectionStyle {
    if (!_cellSelectionStyle) {
        __weak typeof(self) weakSelf = self;
        _cellSelectionStyle = ^(UITableViewCellSelectionStyle selectionStyle){
            _selectionStyle = selectionStyle;
            return weakSelf;
        };
    }
    return _cellSelectionStyle;
}

- (SettingSize)contentLeftMargin {
    if (!_contentLeftMargin) {
        __weak typeof(self) weakSelf = self;
        _contentLeftMargin = ^(CGFloat size){
            _cellContentLeftMargin = size;
            return weakSelf;
        };
    }
    return _contentLeftMargin;
}

- (SettingSize)contentRightMargin {
    if (!_contentRightMargin) {
        __weak typeof(self) weakSelf = self;
        _contentRightMargin = ^(CGFloat size){
            _cellContentRightMargin = size;
            return weakSelf;
        };
    }
    return _contentRightMargin;
}

- (IconSize)leftImageSize {
    if (!_leftImageSize) {
        __weak typeof(self) weakSelf = self;
        _leftImageSize = ^(CGSize size){
            _leftIconSize = size;
            return weakSelf;
        };
    }
    return _leftImageSize;
}

- (IconSize)rightImageSize {
    if (!_rightImageSize) {
        __weak typeof(self) weakSelf = self;
        _rightImageSize = ^(CGSize size){
            _rightIconSize = size;
            return weakSelf;
        };
    }
    return _rightImageSize;
}

- (AddRadius)addLeftIconRadius {
    if (!_addLeftIconRadius) {
        __weak typeof(self) weakSelf = self;
        _addLeftIconRadius = ^(CGFloat radius){
            _leftIconRadius = radius;
            return weakSelf;
        };
    }
    return _addLeftIconRadius;
}

- (AddRadius)addRightIconRadius {
    if (!_addRightIconRadius) {
        __weak typeof(self) weakSelf = self;
        _addRightIconRadius = ^(CGFloat radius){
            _rightIconRadius = radius;
            return weakSelf;
        };
    }
    return _addRightIconRadius;
}

- (TextFont)leftTitleFont {
    if (!_leftTitleFont) {
        __weak typeof(self) weakSelf = self;
        _leftTitleFont = ^(UIFont *font){
            _titleFont = font;
            _titleFontSize = 0;
            return weakSelf;
        };
    }
    return _leftTitleFont;
}

- (TextFontSize)leftTitleFontSize {
    if (!_leftTitleFontSize) {
        __weak typeof(self) weakSelf = self;
        _leftTitleFontSize = ^(CGFloat fontSize){
            _titleFontSize = fontSize;
            _titleFont = nil;
            return weakSelf;
        };
    }
    return _leftTitleFontSize;
}

- (PresentColor)leftTitleColor {
    if (!_leftTitleColor) {
        __weak typeof(self) weakSelf = self;
        _leftTitleColor = ^(UIColor *color){
            _titleColor = color;
            return weakSelf;
        };
    }
    return _leftTitleColor;
}

- (TextFont)descTitleFont {
    if (!_descTitleFont) {
        __weak typeof(self) weakSelf = self;
        _descTitleFont = ^(UIFont *font){
            _descFont = font;
            _descFontSize = 0.0;
            return weakSelf;
        };
    }
    return _descTitleFont;
}

- (TextFontSize)descTitleFontSize {
    if (!_descTitleFontSize) {
        __weak typeof(self) weakSelf = self;
        _descTitleFontSize = ^(CGFloat fontSize){
            _descFontSize = fontSize;
            _descFont = nil;
            return weakSelf;
        };
    }
    return _descTitleFontSize;
}

- (PresentColor)descTitleColor {
    if (!_descTitleColor) {
        __weak typeof(self) weakSelf = self;
        _descTitleColor = ^(UIColor *color){
            _descColor = color;
            return weakSelf;
        };
    }
    return _descTitleColor;
}


- (PresentColor)bottomLineColor {
    if (!_bottomLineColor) {
        __weak typeof(self) weakSelf = self;
        _bottomLineColor = ^(UIColor *color){
            _underlineColor = color;
            return weakSelf;
        };
    }
    return _bottomLineColor;
}

- (SettingSize)bottomLineHeight {
    if (!_bottomLineHeight) {
        __weak typeof(self) weakSelf = self;
        _bottomLineHeight = ^(CGFloat height){
            _underlineHeight = height;
            return weakSelf;
        };
    }
    return _bottomLineHeight;
}

- (PresentColor)redPointColor {
    if (!_redPointColor) {
        __weak typeof(self) weakSelf = self;
        _redPointColor = ^(UIColor *color){
            _redDotColor = color;
            return weakSelf;
        };
    }
    return _redPointColor;
}

- (SettingSize)redPointSize {
    if (!_redPointSize) {
        __weak typeof(self) weakSelf = self;
        _redPointSize = ^(CGFloat height){
            _redDotSize = height;
            return weakSelf;
        };
    }
    return _redPointSize;
}

- (IconSize)arrowIconSize {
    if (!_arrowIconSize) {
        __weak typeof(self) weakSelf = self;
        _arrowIconSize = ^(CGSize size){
            _arrowSize = size;
            return weakSelf;
        };
    }
    return _arrowIconSize;
}

- (SpaceToSuperViewLRMargin)bottomLineEdgeInsets {
    if (!_bottomLineEdgeInsets) {
        __weak typeof(self) weakSelf = self;
        _bottomLineEdgeInsets = ^(UIEdgeInsets insets){
            _cellLineEdgeInsets = insets;
            return weakSelf;
        };
    }
    return _bottomLineEdgeInsets;
}


- (PresentColor)switchOnColor {
    if (!_switchOnColor) {
        __weak typeof(self) weakSelf = self;
        _switchOnColor = ^(UIColor *color){
            _switchOnTintColor = color;
            return weakSelf;
        };
    }
    return _switchOnColor;
}

- (PresentColor)segumentDrawingColor {
    if (!_segumentDrawingColor) {
        __weak typeof(self) weakSelf = self;
        _segumentDrawingColor = ^(UIColor *color){
            _segumentTintColor = color;
            return weakSelf;
        };
    }
    return _segumentDrawingColor;
}

- (SegumentClearRadius)segumentClearRadius {
    if (!_segumentClearRadius) {
        __weak typeof(self) weakSelf = self;
        _segumentClearRadius = ^(BOOL status){
            _isSegumentClearRadius = status;
            return weakSelf;
        };
    }
    return _segumentClearRadius;
}

- (SegumentClearDivider)segumentClearDivider {
    if (!_segumentClearDivider) {
        __weak typeof(self) weakSelf = self;
        _segumentClearDivider = ^(BOOL status){
            _isSegumentClearDivider = status;
            return weakSelf;
        };
    }
    return _segumentClearDivider;
}

- (SegumentItemW)segumentItemW {
    if (!_segumentItemW) {
        __weak typeof(self) weakSelf = self;
        _segumentItemW = ^(NSInteger itemW){
            _segItemW = itemW;
            return weakSelf;
        };
    }
    return _segumentItemW;
}

- (SegumentBorderWidth)segumentBorderWidth {
    if (!_segumentBorderWidth) {
        __weak typeof(self) weakSelf = self;
        _segumentBorderWidth = ^(CGFloat borderWidth){
            _segBorderWidth = borderWidth;
            return weakSelf;
        };
    }
    return _segumentBorderWidth;
}

-  (ViewTextStyleDictionary)segumentNormalTextStyle {
    if (!_segumentNormalTextStyle) {
        __weak typeof(self) weakSelf = self;
        _segumentNormalTextStyle = ^(NSDictionary *dict){
            _segNormalTextStyle = dict;
            return weakSelf;
        };
    }
    return _segumentNormalTextStyle;
}

-  (ViewTextStyleDictionary)segumentSelectedTextStyle {
    if (!_segumentSelectedTextStyle) {
        __weak typeof(self) weakSelf = self;
        _segumentSelectedTextStyle = ^(NSDictionary *dict){
            _segSelectedTextStyle = dict;
            return weakSelf;
        };
    }
    return _segumentSelectedTextStyle;
}

- (PresentColor)textFieldPlaceHolderColor {
    if (!_textFieldPlaceHolderColor) {
        __weak typeof(self) weakSelf = self;
        _textFieldPlaceHolderColor = ^(UIColor *color){
            _textFieldPlaceColor = color;
            return weakSelf;
        };
    }
    return _textFieldPlaceHolderColor;
}

- (TextFont)textFieldPlaceHolderFont {
    if (!_textFieldPlaceHolderFont) {
        __weak typeof(self) weakSelf = self;
        _textFieldPlaceHolderFont = ^(UIFont *font){
            _textFieldPlaceFont = font;
            return weakSelf;
        };
    }
    return _textFieldPlaceHolderFont;
}

- (PresentColor)textFieldTextColor {
    if (!_textFieldTextColor) {
        __weak typeof(self) weakSelf = self;
        _textFieldTextColor = ^(UIColor *color){
            _textFieldColor = color;
            return weakSelf;
        };
    }
    return _textFieldTextColor;
}

- (TextFont)textFieldTextFont {
    if (!_textFieldTextFont) {
        __weak typeof(self) weakSelf = self;
        _textFieldTextFont = ^(UIFont *font){
            _textFieldFont = font;
            _textFieldFontSize = 0;
            return weakSelf;
        };
    }
    return _textFieldTextFont;
}

- (TextFontSize)textFieldTextFontSize {
    if (!_textFieldTextFontSize) {
        __weak typeof(self) weakSelf = self;
        _textFieldTextFontSize = ^(CGFloat fontSize){
            _textFieldFontSize = fontSize;
            _textFieldFont = nil;
            return weakSelf;
        };
    }
    return _textFieldTextFontSize;
}

- (TextFont)hintTextFont {
    if (!_hintTextFont) {
        __weak typeof(self) weakSelf = self;
        _hintTextFont = ^(UIFont *font){
            _hintFont = font;
            _hintFontSize = 0;
            return weakSelf;
        };
    }
    return _hintTextFont;
}

- (TextFontSize)hintTextFontSize {
    if (!_hintTextFontSize) {
        __weak typeof(self) weakSelf = self;
        _hintTextFontSize = ^(CGFloat fontSize){
            _hintFont = nil;
            _hintFontSize = fontSize;
            return weakSelf;
        };
    }
    return _hintTextFontSize;
}

- (PresentColor)hintTextColor {
    if (!_hintTextColor) {
        __weak typeof(self) weakSelf = self;
        _hintTextColor = ^(UIColor *color){
            _hintColor = color;
            return weakSelf;
        };
    }
    return _hintTextColor;
}

- (PresentColor)hintTextBgColor {
    if (!_hintTextBgColor) {
        __weak typeof(self) weakSelf = self;
        _hintTextBgColor = ^(UIColor *color){
            _hintBgColor = color;
            return weakSelf;
        };
    }
    return _hintTextBgColor;
}

- (IconSize)hintViewSize {
    if (!_hintViewSize) {
        __weak typeof(self) weakSelf = self;
        _hintViewSize = ^(CGSize size){
            _hintViewWH = size;
            return weakSelf;
        };
    }
    return _hintViewSize;
}

- (AddRadius)hintViewRadius {
    if (!_hintViewRadius) {
        __weak typeof(self) weakSelf = self;
        _hintViewRadius = ^(CGFloat radius){
            _hintVRadius = radius;
            return weakSelf;
        };
    }
    return _hintViewRadius;
}

- (SexViewStyle)sexLeftViewStyle {
    if (!_sexLeftViewStyle) {
        __weak typeof(self) weakSelf = self;
        _sexLeftViewStyle = ^(BLSettingSexStyleAction action){
            UIFont *sexTitleFont;
            UIColor *sexTitleNormalColor;
            UIColor *sexTitleSelectedColor;
            CGFloat sexTitleLeftMargin;
            CGFloat sexViewWidth;
            if (action) {
                action(&sexTitleFont,&sexTitleNormalColor,&sexTitleSelectedColor,&sexTitleLeftMargin,&sexViewWidth);
                _sexLeftTitleFont = sexTitleFont? sexTitleFont :  [UIFont systemFontOfSize:14];
                _sexLeftTitleNormalColor = sexTitleNormalColor ? sexTitleNormalColor: BLSETTINGHEXCOLOR(0x6B6B6B);
                _sexLeftTitleSelectedColor = sexTitleSelectedColor? sexTitleSelectedColor: BLSETTINGHEXCOLOR(0x333333);
                _sexLeftTitleLeftMargin = sexTitleLeftMargin? sexTitleLeftMargin : 18;
                _sexLeftViewWidth = sexViewWidth ? sexViewWidth : 55;
            }
            return weakSelf;
        };
    }
    return _sexLeftViewStyle;
}

- (SexViewStyle)sexRightViewStyle {
    if (!_sexRightViewStyle) {
        __weak typeof(self) weakSelf = self;
        _sexRightViewStyle = ^(BLSettingSexStyleAction action){
            UIFont *sexTitleFont;
            UIColor *sexTitleNormalColor;
            UIColor *sexTitleSelectedColor;
            CGFloat sexTitleLeftMargin;
            CGFloat sexViewWidth;
            if (action) {
                action(&sexTitleFont,&sexTitleNormalColor,&sexTitleSelectedColor,&sexTitleLeftMargin,&sexViewWidth);
                _sexRightTitleFont = sexTitleFont? sexTitleFont :  [UIFont systemFontOfSize:10];
                _sexRightTitleNormalColor = sexTitleNormalColor ? sexTitleNormalColor: BLSETTINGHEXCOLOR(0x6B6B6B);
                _sexRightTitleSelectedColor = sexTitleSelectedColor? sexTitleSelectedColor: BLSETTINGHEXCOLOR(0x333333);
                _sexRightTitleLeftMargin = sexTitleLeftMargin? sexTitleLeftMargin : 18;
                _sexRightViewWidth = sexViewWidth ? sexViewWidth : 55;
            }
            return weakSelf;
        };
    }
    return _sexRightViewStyle;
}

- (SettingSize)sexLargeImageBothMargin {
    if (!_sexLargeImageBothMargin) {
        __weak typeof(self) weakSelf = self;
        _sexLargeImageBothMargin = ^(CGFloat margin){
            _sexLargeImageMargin = margin;
            return weakSelf;
        };
    }
    return _sexLargeImageBothMargin;
}

- (SettingSize)leftTitleSpaceToLeftIconMargin {
    if (!_leftTitleSpaceToLeftIconMargin) {
        __weak typeof(self) weakSelf = self;
        _leftTitleSpaceToLeftIconMargin = ^(CGFloat margin){
            _leftTitleToLeftIconMargin = margin;
            return weakSelf;
        };
    }
    return _leftTitleSpaceToLeftIconMargin;
}

- (SettingSize)rightDescSpaceToRightArrowMargin {
    if (!_rightDescSpaceToRightArrowMargin) {
        __weak typeof(self) weakSelf = self;
        _rightDescSpaceToRightArrowMargin = ^(CGFloat margin){
            _rightDescToRightArrowMargin = margin;
            return weakSelf;
        };
    }
    return _rightDescSpaceToRightArrowMargin;
}

- (SettingSize)rightIconSpaceToRightArrowMargin {
    if (!_rightIconSpaceToRightArrowMargin) {
        __weak typeof(self) weakSelf = self;
        _rightIconSpaceToRightArrowMargin = ^(CGFloat margin){
            _rightIconToRightArrowMargin = margin;
            return weakSelf;
        };
    }
    return _rightIconSpaceToRightArrowMargin;
}

- (SettingSize)avaterTitleSpaceToCellCenterYMargin {
    if (!_avaterTitleSpaceToCellCenterYMargin) {
        __weak typeof(self) weakSelf = self;
        _avaterTitleSpaceToCellCenterYMargin = ^(CGFloat margin){
            _avaterTitleToCellCenterYMargin = margin;
            return weakSelf;
        };
    }
    return _avaterTitleSpaceToCellCenterYMargin;
}

- (SettingSize)avaterDescSpaceToCellCenterYMargin {
    if (!_avaterDescSpaceToCellCenterYMargin) {
        __weak typeof(self) weakSelf = self;
        _avaterDescSpaceToCellCenterYMargin = ^(CGFloat margin){
            _avaterDescToCellCenterYMargin = margin;
            return weakSelf;
        };
    }
    return _avaterDescSpaceToCellCenterYMargin;
}

- (SettingSize)subCellTitleSpaceToCellCenterYMargin{
    if (!_subCellTitleSpaceToCellCenterYMargin) {
        __weak typeof(self) weakSelf = self;
        _subCellTitleSpaceToCellCenterYMargin = ^(CGFloat margin){
            _subCellTitleToCellCenterYMargin = margin;
            return weakSelf;
        };
    }
    return _subCellTitleSpaceToCellCenterYMargin;
}

- (SettingSize)subCellSubTitleSpaceToCellCenterYMargin {
    if (!_subCellSubTitleSpaceToCellCenterYMargin) {
        __weak typeof(self) weakSelf = self;
        _subCellSubTitleSpaceToCellCenterYMargin = ^(CGFloat margin){
            _subCellSubTitleToCellCenterYMargin = margin;
            return weakSelf;
        };
    }
    return _subCellSubTitleSpaceToCellCenterYMargin;
}

@end
