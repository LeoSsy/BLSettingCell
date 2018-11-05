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
@synthesize leftIconPlaceholder = _leftIconPlaceholder;
@synthesize leftIconImage = _leftIconImage;
@synthesize leftIconNormalSelImageName = _leftIconNormalSelImageName;
@synthesize rightIconName = _rightIconName;
@synthesize rightIconPlaceholder = _rightIconPlaceholder;
@synthesize rightIconImage = _rightIconImage;
@synthesize rightIconNormalSelImageName = _rightIconNormalSelImageName;
@synthesize arrowIconName = _arrowIconName;
@synthesize titleText = _titleText;
@synthesize titleAttribute = _titleAttribute;
@synthesize descTitle = _descTitle;
@synthesize descAttribute = _descAttribute;
@synthesize showArrow = _showArrow;
@synthesize showUnderLine = _showUnderLine;
@synthesize extDictionary = _extDictionary;
@synthesize cellH = _cellH;
@synthesize style = _style;
@synthesize switchOn = _switchOn;
@synthesize switchDelyOn = _switchDelyOn;
@synthesize segumentSelIndex = _segumentSelIndex;
@synthesize segumentTitlesArr = _segumentTitlesArr;
@synthesize textFieldPlaceHolder = _textFieldPlaceHolder;
@synthesize textFieldText = _textFieldText;
@synthesize textFieldTextMaxLength = _textFieldTextMaxLength;
@synthesize textFieldEnabled = _textFieldEnabled;
@synthesize cellClikedAction = _cellClikedAction;
@synthesize switchAction = _switchAction;
@synthesize segumentAction = _segumentAction;
@synthesize textFieldDidChangeAction = _textFieldDidChangeAction;
@synthesize textFieldTextReachesMaxLengthAction = _textFieldTextReachesMaxLengthAction;
@synthesize textFieldKeyboardType = _textFieldKeyboardType;
@synthesize textFieldTextAlignmentMode = _textFieldTextAlignmentMode;
@synthesize hintViewType = _hintViewType;
@synthesize hintText = _hintText;
@synthesize sexLeftViewData = _sexLeftViewData;
@synthesize sexRightViewData = _sexRightViewData;
@synthesize sexLeftLargeImageData = _sexLeftLargeImageData;
@synthesize sexRightLargeImageData = _sexRightLargeImageData;
@synthesize sexSelType = _sexSelType;
@synthesize sexAction = _sexAction;

@synthesize leftImageName = _leftImageName;
@synthesize leftIconPlaceholderName = _leftIconPlaceholderName;
@synthesize leftImageObj = _leftImageObj;
@synthesize leftNormalImageName = _leftNormalImageName;
@synthesize leftSelectedImageName = _leftSelectedImageName;
@synthesize rightImageName = _rightImageName;
@synthesize rightIconPlaceholderName = _rightIconPlaceholderName;
@synthesize rightImageObj = _rightImageObj;
@synthesize rightNormalImageName = _rightNormalImageName;
@synthesize rightSelectedImageName = _rightSelectedImageName;
@synthesize arrowImageName = _arrowImageName;
@synthesize title = _title;
@synthesize titleAttributeString = _titleAttributeString;
@synthesize detailTitle = _detailTitle;
@synthesize detailAttributeString = _detailAttributeString;
@synthesize isShowArrow = _isShowArrow;
@synthesize isShowUnderLine = _isShowUnderLine;
@synthesize cellType = _cellType;
@synthesize cellHeight = _cellHeight;
@synthesize settingStyle = _settingStyle;
@synthesize switchIsOn = _switchIsOn;
@synthesize switchIsDelyOn = _switchIsDelyOn;
@synthesize selectIndex = _selectIndex;
@synthesize segumentTitleArr = _segumentTitleArr;
@synthesize textFieldPlaceHolderText = _textFieldPlaceHolderText;
@synthesize textFieldString = _textFieldString;
@synthesize textFieldStringMaxLength = _textFieldStringMaxLength;
@synthesize textFieldCanEditing = _textFieldCanEditing;
@synthesize cellClickOperation = _cellClickOperation;
@synthesize cellSwitchOperation = _cellSwitchOperation;
@synthesize cellSegumentOperation = _cellSegumentOperation;
@synthesize textFieldDidChangeOperation = _textFieldDidChangeOperation;
@synthesize textFieldTextMaxLengthOperation = _textFieldTextMaxLengthOperation;
@synthesize textFieldKeyboardtype = _textFieldKeyboardtype;
@synthesize textFieldTextAlignment = _textFieldTextAlignment;
@synthesize hintType = _hintType;
@synthesize sexLeftNormalImage = _sexLeftNormalImage;
@synthesize sexLeftSelectedImage = _sexLeftSelectedImage;
@synthesize sexLeftTitle = _sexLeftTitle;
@synthesize sexRightNormalImage = _sexRightNormalImage;
@synthesize sexRightSelectedImage = _sexRightSelectedImage;
@synthesize sexRightTitle = _sexRightTitle;
@synthesize sexSelectType = _sexSelectType;
@synthesize sexOperation = _sexOperation;

+ (instancetype)model {
    BLSettingModel *model = [[self alloc] init];
    model.style([BLSettingStyle style])
    .type(BLSettingCellTypeNormal)
    .showUnderLine(YES).cellH(44).textFieldEnabled(YES).textFieldTextMaxLength(20).textFieldTextAlignmentMode(NSTextAlignmentRight);
    return model;
}

+ (instancetype)modelType:(BLSettingCellType)cellType {
    BLSettingModel *model = [BLSettingModel model];
    model.type(cellType);
    return model;
}

+ (instancetype)modelStyle:(BLSettingStyle*)settingStyle {
    BLSettingModel *model = [BLSettingModel model];
    model.style(settingStyle);
    return model;
}

+ (instancetype)modelType:(BLSettingCellType)cellType style:(BLSettingStyle*)settingStyle {
    BLSettingModel *model = [BLSettingModel model];
    model.type(cellType).style(settingStyle);
    return model;
}

- (instancetype)initWithIcon:(NSString*)iconName title:(NSString*)title detailTitle:(NSString*)detailTitle cellType:(BLSettingCellType)cellType segumentTitleArr:(NSArray*)segumentTitlesArr selectIndex:(NSInteger)selectIndex isShowArrow:(BOOL)isShowArrow switchIsOn:(BOOL)switchIsOn rightIcon:(NSString*)rightIconName settingStyle:(BLSettingStyle*)settingStyle {
    if (self = [super init]) {
        _isShowUnderLine = YES;
        _leftImageName = (iconName ==nil || [iconName isEqualToString:@""]) ? nil : iconName;
        _title =title;
        _cellType = cellType;
        _detailTitle = detailTitle;
        _isShowArrow = isShowArrow;
        _switchIsOn = switchIsOn;
        _segumentTitleArr = segumentTitlesArr;
        _selectIndex = selectIndex;
        _rightImageName = (rightIconName ==nil || [rightIconName isEqualToString:@""]) ? nil : rightIconName;
        _settingStyle = settingStyle?settingStyle:[BLSettingStyle style];
        _cellHeight = 44;
        _textFieldCanEditing = YES;
        _textFieldStringMaxLength = 20;
        _textFieldTextAlignment = NSTextAlignmentRight;
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
            _leftImageName = imageName;
            _leftImageObj = nil;
            _leftNormalImageName = nil;
            _leftSelectedImageName = nil;
            return weakSelf;
        };
    }
    return _leftIconName;
}

- (IconNameResource)leftIconPlaceholder {
    if (!_leftIconPlaceholder) {
        __weak typeof(self) weakSelf = self;
        _leftIconPlaceholder = ^(NSString *imageName){
            _leftIconPlaceholderName = imageName;
            return weakSelf;
        };
    }
    return _leftIconPlaceholder;
}

- (IconImage)leftIconImage {
    if (!_leftIconImage) {
        __weak typeof(self) weakSelf = self;
        _leftIconImage = ^(UIImage *image){
            _leftImageObj = image;
            _leftImageName = nil;
            _leftNormalImageName = nil;
            _leftSelectedImageName = nil;
            return weakSelf;
        };
    }
    return _leftIconImage;
}

- (SexViewLargeImageDataConfig)leftIconNormalSelImageName {
    if (!_leftIconNormalSelImageName) {
        __weak typeof(self) weakSelf = self;
        _leftIconNormalSelImageName = ^(sexLargeImageDataConfig config){
            NSString *sexNormalImage;
            NSString *sexSelectedImage;
            if (config) {
                config(&sexNormalImage,&sexSelectedImage);
                if (sexNormalImage) {
                    _leftNormalImageName = sexNormalImage;
                    //清空之前设置的左边的图片
                    _leftImageName = nil;
                    _leftImageObj = nil;
                };
                if (sexSelectedImage) _leftSelectedImageName = sexSelectedImage;
            }
            return weakSelf;
        };
    }
    return _leftIconNormalSelImageName;
}

- (IconNameResource)rightIconName {
    if (!_rightIconName) {
        __weak typeof(self) weakSelf = self;
        _rightIconName = ^(NSString *imageName){
            _rightImageName = imageName;
            _rightImageObj = nil;
            _rightNormalImageName = nil;
            _leftSelectedImageName = nil;
            return weakSelf;
        };
    }
    return _rightIconName;
}

- (IconNameResource)rightIconPlaceholder {
    if (!_rightIconPlaceholder) {
        __weak typeof(self) weakSelf = self;
        _rightIconPlaceholder = ^(NSString *imageName){
            _rightIconPlaceholderName = imageName;
            return weakSelf;
        };
    }
    return _rightIconPlaceholder;
}

- (IconImage)rightIconImage {
    if (!_rightIconImage) {
        __weak typeof(self) weakSelf = self;
        _rightIconImage = ^(UIImage *image){
            _rightImageObj = image;
            _rightImageName = nil;
            _rightNormalImageName = nil;
            _leftSelectedImageName = nil;
            return weakSelf;
        };
    }
    return _rightIconImage;
}

- (SexViewLargeImageDataConfig)rightIconNormalSelImageName {
    if (!_rightIconNormalSelImageName) {
        __weak typeof(self) weakSelf = self;
        _rightIconNormalSelImageName = ^(sexLargeImageDataConfig config){
            NSString *normalImage;
            NSString *selectedImage;
            if (config) {
                config(&normalImage,&selectedImage);
                if (normalImage) {
                    _rightNormalImageName = normalImage;
                    //清空之前设置的左边的图片
                    _rightImageName = nil;
                    _rightImageObj = nil;
                };
                if (selectedImage) _rightSelectedImageName = selectedImage;
            }
            return weakSelf;
        };
    }
    return _rightIconNormalSelImageName;
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
            _detailTitle = nil;
            return weakSelf;
        };
    }
    return _descAttribute;
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

- (ExtDictionary)extDictionary {
    if (!_extDictionary) {
        __weak typeof(self) weakSelf = self;
        _extDictionary = ^(NSMutableDictionary *ext){
            _ext = ext;
            return weakSelf;
        };
    }
    return _extDictionary;
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

- (DisPlayStatus)switchDelyOn {
    if (!_switchDelyOn) {
        __weak typeof(self) weakSelf = self;
        _switchDelyOn = ^(BOOL status){
            _switchIsDelyOn = status;
            return weakSelf;
        };
    }
    return _switchDelyOn;
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

- (SegumentSelectIndex)segumentSelIndex {
    if (!_segumentSelIndex) {
        __weak typeof(self) weakSelf = self;
        _segumentSelIndex = ^(NSInteger index){
            _selectIndex = index;
            return weakSelf;
        };
    }
    return _segumentSelIndex;
}

- (SegumentTitlsArr)segumentTitlesArr {
    if (!_segumentTitlesArr) {
        __weak typeof(self) weakSelf = self;
        _segumentTitlesArr = ^(NSArray *titleArr){
            _segumentTitleArr = titleArr;
            return weakSelf;
        };
    }
    return _segumentTitlesArr;
}

- (CellClikedOperation)cellClikedAction {
    if (!_cellClikedAction) {
        __weak typeof(self) weakSelf = self;
        _cellClikedAction = ^(cellClickAction cellOperationBlock){
            _cellClickOperation = cellOperationBlock;
            return weakSelf;
        };
    }
    return _cellClikedAction;
}

- (CellSwitchOperation)switchAction {
    if (!_switchAction) {
        __weak typeof(self) weakSelf = self;
        _switchAction = ^(cellSwitchAction cellSwitchBlock){
            _cellSwitchOperation = cellSwitchBlock;
            return weakSelf;
        };
    }
    return _switchAction;
}

- (CellSegumentOperation)segumentAction {
    if (!_segumentAction) {
        __weak typeof(self) weakSelf = self;
        _segumentAction = ^(cellSegumentAction cellSegumentBlock){
            _cellSegumentOperation = cellSegumentBlock;
            return weakSelf;
        };
    }
    return _segumentAction;
}

- (Text)textFieldPlaceHolder {
    if (!_textFieldPlaceHolder) {
        __weak typeof(self) weakSelf = self;
        _textFieldPlaceHolder = ^(NSString *text){
            _textFieldPlaceHolderText = text;
            return weakSelf;
        };
    }
    return _textFieldPlaceHolder;
}

- (Text)textFieldText {
    if (!_textFieldText) {
        __weak typeof(self) weakSelf = self;
        _textFieldText = ^(NSString *text){
            _textFieldString = text;
            return weakSelf;
        };
    }
    return _textFieldText;
}

- (TextFieldTextMaxLength)textFieldTextMaxLength {
    if (!_textFieldTextMaxLength) {
        __weak typeof(self) weakSelf = self;
        _textFieldTextMaxLength = ^(NSInteger maxLength){
            _textFieldStringMaxLength = maxLength;
            return weakSelf;
        };
    }
    return _textFieldTextMaxLength;
}

- (DisPlayStatus)textFieldEnabled {
    if (!_textFieldEnabled) {
        __weak typeof(self) weakSelf = self;
        _textFieldEnabled = ^(BOOL status){
            _textFieldCanEditing = status;
            return weakSelf;
        };
    }
    return _textFieldEnabled;
}

- (TextFieldDidChangeAction)textFieldDidChangeAction {
    if (!_textFieldDidChangeAction) {
        __weak typeof(self) weakSelf = self;
        _textFieldDidChangeAction = ^(textFieldDidChangeAction action){
            _textFieldDidChangeOperation = action;
            return weakSelf;
        };
    }
    return _textFieldDidChangeAction;
}

- (TextFieldTextReachesMaxLengthAction)textFieldTextReachesMaxLengthAction{
    if (!_textFieldTextReachesMaxLengthAction) {
        __weak typeof(self) weakSelf = self;
        _textFieldTextReachesMaxLengthAction = ^(textFieldTextReachesMaxLengthAction action){
            _textFieldTextMaxLengthOperation = action;
            return weakSelf;
        };
    }
    return _textFieldTextReachesMaxLengthAction;
}

- (TextFieldKeyboardType)textFieldKeyboardType {
    if (!_textFieldKeyboardType) {
        __weak typeof(self) weakSelf = self;
        _textFieldKeyboardType = ^(UIKeyboardType type){
            _textFieldKeyboardtype = type;
            return weakSelf;
        };
    }
    return _textFieldKeyboardType;
}

- (TextAlignmentMode)textFieldTextAlignmentMode {
    if (!_textFieldTextAlignmentMode) {
        __weak typeof(self) weakSelf = self;
        _textFieldTextAlignmentMode = ^(NSTextAlignment mode){
            _textFieldTextAlignment = mode;
            return weakSelf;
        };
    }
    return _textFieldTextAlignmentMode;
}

- (NewFeatureHintType)hintViewType{
    if (!_hintViewType) {
        __weak typeof(self) weakSelf = self;
        _hintViewType = ^(BLSettingNewFeatureHintType  type){
            _hintType = type;
            return weakSelf;
        };
    }
    return _hintViewType;
}


- (Text)hintText {
    if (!_hintText) {
        __weak typeof(self) weakSelf = self;
        _hintText = ^(NSString*  text){
            _hintString = text;
            return weakSelf;
        };
    }
    return _hintText;
}

- (SexViewDataConfig)sexLeftViewData {
    if (!_sexLeftViewData) {
        __weak typeof(self) weakSelf = self;
        _sexLeftViewData = ^(sexVDataConfig config){
            NSString *sexTitle;
            NSString *sexNormalImage;
            NSString *sexSelectedImage;
            if (config) {
                config(&sexTitle,&sexNormalImage,&sexSelectedImage);
                if (sexTitle) _sexLeftTitle = sexTitle;
                if (sexNormalImage) _sexLeftNormalImage = sexNormalImage;
                if (sexSelectedImage) _sexLeftSelectedImage = sexSelectedImage;
            }
            return weakSelf;
        };
    }
    return _sexLeftViewData;
}

- (SexViewDataConfig)sexRightViewData {
    if (!_sexRightViewData) {
        __weak typeof(self) weakSelf = self;
        _sexRightViewData = ^(sexVDataConfig config){
            NSString *sexTitle;
            NSString *sexNormalImage;
            NSString *sexSelectedImage;
            if (config) {
                config(&sexTitle,&sexNormalImage,&sexSelectedImage);
                if (sexTitle) _sexRightTitle = sexTitle;
                if (sexNormalImage) _sexRightNormalImage = sexNormalImage;
                if (sexSelectedImage) _sexRightSelectedImage = sexSelectedImage;
            }
            return weakSelf;
        };
    }
    return _sexRightViewData;
}

- (SexViewLargeImageDataConfig)sexLeftLargeImageData {
    if (!_sexLeftLargeImageData) {
        __weak typeof(self) weakSelf = self;
        _sexLeftLargeImageData = ^(sexLargeImageDataConfig config){
            NSString *sexNormalImage;
            NSString *sexSelectedImage;
            if (config) {
                config(&sexNormalImage,&sexSelectedImage);
                if (sexNormalImage) _sexLeftNormalImage = sexNormalImage;
                if (sexSelectedImage) _sexLeftSelectedImage = sexSelectedImage;
            }
            return weakSelf;
        };
    }
    return _sexLeftLargeImageData;
}

- (SexViewLargeImageDataConfig)sexRightLargeImageData {
    if (!_sexRightLargeImageData) {
        __weak typeof(self) weakSelf = self;
        _sexRightLargeImageData = ^(sexLargeImageDataConfig config){
            NSString *sexNormalImage;
            NSString *sexSelectedImage;
            if (config) {
                config(&sexNormalImage,&sexSelectedImage);
                if (sexNormalImage) _sexRightNormalImage = sexNormalImage;
                if (sexSelectedImage) _sexRightSelectedImage = sexSelectedImage;
            }
            return weakSelf;
        };
    }
    return _sexRightLargeImageData;
}

- (SexSelType)sexSelType {
    if (!_sexSelType) {
        __weak typeof(self) weakSelf = self;
        _sexSelType = ^(BLSettingSexSelectType sexSelType){
            _sexSelectType = sexSelType;
            return weakSelf;
        };
    }
    return _sexSelType;
}

- (SexAction)sexAction {
    if (!_sexAction) {
        __weak typeof(self) weakSelf = self;
        _sexAction = ^(sexAction action){
            _sexOperation = action;
            return weakSelf;
        };
    }
    return _sexAction;
}


@end


