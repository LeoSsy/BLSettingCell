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

@interface BLSettingRightTextFieldCell()<UITextFieldDelegate>
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
    _textField.delegate = self;
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
        make.right.equalTo(self.contentView).offset(-self.dataModel.settingStyle.cellContentRightMargin);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.underline.mas_top);
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
    
    CGFloat width = 0;
    if (dataModel.title) {
        width = [dataModel.title boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.dataModel.settingStyle.titleFont} context:nil].size.width;
    }else if (dataModel.titleAttributeString){
        width = [dataModel.titleAttributeString boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.width;
    }
    width = ceil(width);
    //计算标题的宽度
    if (width > [UIScreen mainScreen].bounds.size.width *0.5) {
        width = [UIScreen mainScreen].bounds.size.width *0.5;
    }
    [self.titleL mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}

#pragma mark UITextFieldDelegate

#pragma mark - Notification Method
-(void)textFieldDidChange:(NSNotification *)obj
{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    if (obj.object != self.textField)  return;
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position){
        if (toBeString.length > self.dataModel.textFieldStringMaxLength){
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.dataModel.textFieldStringMaxLength];
            if (rangeIndex.length == 1){
                textField.text = [toBeString substringToIndex:self.dataModel.textFieldStringMaxLength];
            } else{
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.dataModel.textFieldStringMaxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
            
            if (self.dataModel.textFieldTextMaxLengthOperation) {
                self.dataModel.textFieldTextMaxLengthOperation(self.dataModel, self.textField);
            }
            if ((self.dataModel ==  self.textField.settingModel)) {
                //更新模型对应文本字段属性的文字
                self.dataModel.textFieldText(self.textField.text);
            }
            
        }else{
            if (self.dataModel.textFieldDidChangeOperation) {
                self.dataModel.textFieldDidChangeOperation(self.dataModel, self.textField);
            }
            
            if ((self.dataModel ==  self.textField.settingModel)) {
                //更新模型对应文本字段属性的文字
                self.dataModel.textFieldText(self.textField.text);
            }
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

