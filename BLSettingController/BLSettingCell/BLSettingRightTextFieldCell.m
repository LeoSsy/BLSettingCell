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
    _textField.placeholder = @"请输入内容";
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.textAlignment = NSTextAlignmentRight;
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
        make.right.equalTo(self.contentView).offset(-BLSettingBaseMargin);
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
    
    [self.textField setValue:dataModel.settingStyle.textFieldPlaceColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.textField setValue:dataModel.settingStyle.textFieldPlaceFont forKeyPath:@"_placeholderLabel.font"];
    
    if (dataModel.textFieldString) {
        self.textField.text = dataModel.textFieldString;
    }else{
        if (dataModel.textFieldPlaceHolderText) {
            self.textField.placeholder = dataModel.textFieldPlaceHolderText;
        }else{
            self.textField.placeholder = @"请输入内容";
        }
    }
    self.textField.textColor = dataModel.settingStyle.textFieldColor;
    self.textField.font = dataModel.settingStyle.textFieldFont;
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidChange:(NSNotification*)note{
    if (note.object == self.textField) {
        if (self.textField.text.length > self.dataModel.textFieldStringMaxLength) {
            self.textField.text = [self.textField.text substringToIndex:self.dataModel.textFieldStringMaxLength];
            if (self.dataModel.textFieldTextReachesMaxLengthAction) {
                self.dataModel.textFieldTextMaxLengthOperation(self.dataModel,self.textField);
            }
        }else{
            if (self.dataModel.textFieldDidChangeAction) {
                self.dataModel.textFieldDidChangeOperation(self.dataModel, self.textField);
            }
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
