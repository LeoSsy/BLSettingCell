//
//  BLSettingRightTextField.m
//  BLSettingController
//
//  Created by Jack on 2018/8/16.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "BLSettingRightTextFieldCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UITextField+BLSettingCell.h"

@interface BLSettingRightTextFieldCell()
/**右边的文本框*/
@property(nonatomic,strong)UITextField *textField;
@end

@implementation BLSettingRightTextFieldCell

/**
 创建控件
 */
- (void)buildSubview {
    [super buildSubview];
    _textField = [[UITextField alloc] init];
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.textAlignment = self.dataModel.textFieldTextAlignment;
    _textField.keyboardType = self.dataModel.textFieldKeyboardtype;
    [ self.contentView addSubview:_textField];
    
    //监听文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

/**
 布局控件
 */
- (void)setFrameSubview {
    [super setFrameSubview];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentLeftMargin);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView).multipliedBy(0.8);
        make.left.equalTo(self.titleL.mas_right).offset(BLSettingBaseMargin);
    }];
}

/**
 设置数据模型
 @param dataModel 数据模型
 */
- (void)configModel:(BLSettingModel *)dataModel{
    if (!dataModel)  return;
    [super configModel:dataModel];
    //清空之前的文字
    self.textField.placeholder = nil;
    self.textField.text = nil;
    //重新设置数据
    NSString *placeholder = @"请输入内容";
    if (dataModel.textFieldString) {
        self.textField.text = dataModel.textFieldString;
    }else{
        if (dataModel.textFieldPlaceHolderText) {
            placeholder = dataModel.textFieldPlaceHolderText;
        }
    }
    self.textField.placeholder = placeholder;
    self.textField.textColor = dataModel.settingStyle.textFieldColor;
    if (dataModel.settingStyle.textFieldFont) {
        self.textField.font = dataModel.settingStyle.textFieldFont;
    }else if (dataModel.settingStyle.textFieldTextFontSize){
        self.textField.font = [UIFont systemFontOfSize:dataModel.settingStyle.textFieldFontSize];
    }
    
    //文字对齐方式和键盘类型
    self.textField.textAlignment = self.dataModel.textFieldTextAlignment;
    self.textField.keyboardType = self.dataModel.textFieldKeyboardtype;
    
    //文本框禁用
    self.textField.enabled = dataModel.textFieldCanEditing;
    self.textField.settingModel = dataModel;
    
    //占位文字设置
    [self.textField setValue:dataModel.settingStyle.textFieldPlaceColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.textField setValue:dataModel.settingStyle.textFieldPlaceFont forKeyPath:@"_placeholderLabel.font"];
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidChange:(NSNotification*)note{
    if (note.object == self.textField) {
        if (self.textField.text.length > self.dataModel.textFieldStringMaxLength) {
            self.textField.text = [self.textField.text substringToIndex:self.dataModel.textFieldStringMaxLength];
            if (self.dataModel.textFieldTextMaxLengthOperation) {
                self.dataModel.textFieldTextMaxLengthOperation(self.dataModel, self.textField);
            }
        }else{
            if (self.dataModel.textFieldDidChangeOperation) {
                self.dataModel.textFieldDidChangeOperation(self.dataModel, self.textField);
            }
        }
        if ((self.dataModel ==  self.textField.settingModel)) {
            //更新模型对应文本字段属性的文字
            self.dataModel.textFieldText(self.textField.text);
        }
    }

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
