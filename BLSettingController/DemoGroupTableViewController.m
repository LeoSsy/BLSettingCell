//
//  DemoTableViewController.m
//  BaseSettingCellExample
//
//  Created by Jack on 2018/5/10.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "DemoGroupTableViewController.h"
#import "BLSetting.h"
#import "YYFPSLabel.h"

@interface DemoGroupTableViewController ()
@property(nonatomic,strong)NSMutableArray *datas;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

@implementation DemoGroupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    _datas = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    _fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.frame = CGRectMake(15, self.view.bounds.size.height - 44, self.view.bounds.size.width-30, 22);
    _fpsLabel.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:_fpsLabel];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    _datas = [NSMutableArray array];
    
    //默认样式
    BLSettingModel *md001 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我是默认描述" showArrow:YES cellClickAction:nil];
    md001.cellH(120).cellClikedAction(^(BLSettingModel *model) {
        NSLog(@"%@", model.indexPath);
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"13544" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    
    md001.descAttribute(attr);
    
    //创建右侧图标类型
    BLSettingModel *model000 = [BLSettingFactory normalWithIcon:nil title:@"右侧辅助视图" rightIcon:@"kehu_icon_jilu2" showArrow:YES cellClickAction:^(BLSettingModel *model) {
        
    }];
    model000.rightIconImage([UIImage imageNamed:@"completeinfo_xingbie_nv_selected"]);
    
    
    //创建性别大图选择类型样式
    BLSettingStyle *style00 = [BLSettingStyle style];
    style00.leftImageSize(CGSizeMake(90, 90))
    .rightImageSize(CGSizeMake(90, 90))
    .sexLargeImageBothMargin(25)
    .bottomLineHeight(10)
    .bottomLineColor([UIColor redColor]);
    
    //创建性别大图选择类型cell
    BLSettingModel *model00 = [BLSettingModel modelType:BLSettingCellTypeSexLargeImage];
    model00.sexLeftLargeImageData(^(NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexNormalImage = @"completeinfo_xingbie_nv_normal";
        *sexSelectedImage = @"completeinfo_xingbie_nv_selected";
    }).sexRightLargeImageData(^(NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexNormalImage = @"completeinfo_xingbie_nan_normal";
        *sexSelectedImage = @"completeinfo_xingbie_nan_selected";
    })
    .cellH(120)
    .sexAction(^(BLSettingModel *model, BLSettingSexSelectType sexSelType) {
        NSLog(@"%@",sexSelType==BLSettingSexSelectTypeLeft?@"女":@"男");
    }).style(style00);
    
    //创建性别大图选择类型cell
    BLSettingModel *model01 = [BLSettingModel modelType:BLSettingCellTypeSexLargeImage];
    model01.sexLeftLargeImageData(^(NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexNormalImage = @"completeinfo_xingbie_nv_normal";
        *sexSelectedImage = @"completeinfo_xingbie_nv_selected";
    }).sexRightLargeImageData(^(NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexNormalImage = @"completeinfo_xingbie_nan_normal";
        *sexSelectedImage = @"completeinfo_xingbie_nan_selected";
    })
    .cellH(120)
    .sexAction(^(BLSettingModel *model, BLSettingSexSelectType sexSelType) {
        NSLog(@"%@",sexSelType==BLSettingSexSelectTypeLeft?@"女":@"男");
    }).style(style00);
    
    //创建性别大图选择类型cell
    BLSettingModel *model02 = [BLSettingModel modelType:BLSettingCellTypeSexLargeImage];
    model02.sexLeftLargeImageData(^(NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexNormalImage = @"completeinfo_xingbie_nv_normal";
        *sexSelectedImage = @"completeinfo_xingbie_nv_selected";
    }).sexRightLargeImageData(^(NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexNormalImage = @"completeinfo_xingbie_nan_normal";
        *sexSelectedImage = @"completeinfo_xingbie_nan_selected";
    })
    .cellH(120)
    .sexAction(^(BLSettingModel *model, BLSettingSexSelectType sexSelType) {
        NSLog(@"%@",sexSelType==BLSettingSexSelectTypeLeft?@"女":@"男");
    }).style(style00);
    
    //设置性别按钮展示样式
    BLSettingStyle *style0 = [BLSettingStyle style];
    style0.sexLeftViewStyle(^void (UIFont *__autoreleasing *sexTitleFont, UIColor *__autoreleasing *sexTitleNormalColor, UIColor *__autoreleasing *sexTitleSelectedColor, CGFloat *sexTitleLeftMargin, CGFloat *sexViewWidth) {
        *sexTitleFont = [UIFont systemFontOfSize:13];
        *sexTitleNormalColor = [UIColor blackColor];
        *sexTitleSelectedColor = [UIColor greenColor];
        *sexTitleLeftMargin = 15;
        *sexViewWidth = 45;
    })
    .sexRightViewStyle(^(UIFont *__autoreleasing *sexTitleFont, UIColor *__autoreleasing *sexTitleNormalColor, UIColor *__autoreleasing *sexTitleSelectedColor, CGFloat *sexTitleLeftMargin, CGFloat *sexViewWidth) {
        *sexTitleFont = [UIFont systemFontOfSize:13];
        *sexTitleNormalColor = [UIColor blackColor];
        *sexTitleSelectedColor = [UIColor greenColor];
        *sexTitleLeftMargin = 15;
        *sexViewWidth = 45;
    });
    
    //创建性别类型cell
    BLSettingModel *model0 = [BLSettingModel model];
    model0.type(BLSettingCellTypeSex)
    .titleText(@"性别")
    .sexLeftViewData(^(NSString *__autoreleasing *sexTitle, NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexTitle = @"女";
        *sexNormalImage = @"women_no_select";
        *sexSelectedImage = @"edit_woman_click";
    }).sexRightViewData(^(NSString *__autoreleasing *sexTitle, NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexTitle = @"男";
        *sexNormalImage = @"man_no_select";
        *sexSelectedImage = @"edit_man_click";
    })
    .sexAction(^(BLSettingModel *model, BLSettingSexSelectType sexSelType) {
        NSLog(@"%@",sexSelType==BLSettingSexSelectTypeLeft?@"女":@"男");
    })
    .style(style0);
    
    //创建性别类型cell
    BLSettingModel *modelsex0 = [BLSettingModel model];
    modelsex0.type(BLSettingCellTypeSex)
    .titleText(@"性别")
    .sexLeftViewData(^(NSString *__autoreleasing *sexTitle, NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexTitle = @"女";
        *sexNormalImage = @"women_no_select";
        *sexSelectedImage = @"edit_woman_click";
    }).sexRightViewData(^(NSString *__autoreleasing *sexTitle, NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexTitle = @"男";
        *sexNormalImage = @"man_no_select";
        *sexSelectedImage = @"edit_man_click";
    })
    .sexAction(^(BLSettingModel *model, BLSettingSexSelectType sexSelType) {
        NSLog(@"%@",sexSelType==BLSettingSexSelectTypeLeft?@"女":@"男");
    })
    .style(style0);
    
    //创建性别类型cell
    BLSettingModel *modelsex1 = [BLSettingModel model];
    modelsex1.type(BLSettingCellTypeSex)
    .titleText(@"性别")
    .sexLeftViewData(^(NSString *__autoreleasing *sexTitle, NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexTitle = @"女";
        *sexNormalImage = @"women_no_select";
        *sexSelectedImage = @"edit_woman_click";
    }).sexRightViewData(^(NSString *__autoreleasing *sexTitle, NSString *__autoreleasing *sexNormalImage, NSString *__autoreleasing *sexSelectedImage) {
        *sexTitle = @"男";
        *sexNormalImage = @"man_no_select";
        *sexSelectedImage = @"edit_man_click";
    })
    .sexAction(^(BLSettingModel *model, BLSettingSexSelectType sexSelType) {
        NSLog(@"%@",sexSelType==BLSettingSexSelectTypeLeft?@"女":@"男");
    })
    .style(style0);
    
    
    //默认样式
    BLSettingStyle *stylenormal = [BLSettingStyle style];
    stylenormal.hintViewSize(CGSizeMake(80, 24)).hintViewRadius(12).hintTextBgColor([UIColor purpleColor])
    .leftTitleSpaceToLeftIconMargin(5)
    .rightDescSpaceToRightArrowMargin(5);
    BLSettingModel *md1 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式888" detailTitle:@"我是默认描述" showArrow:YES cellClickAction:nil];
    md1.cellH(120).cellClikedAction(^(BLSettingModel *model) {
        NSLog(@"%@", model.indexPath);
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    //设置显示新功能提示视图 并设置 文字和样式
    md1.hintViewType(BLSettingNewFeatureHintTypeText).hintText(@"发现新功能").style(stylenormal);
    
    //设置小红点样式
    BLSettingStyle *stylenormal1 = [BLSettingStyle style];
    stylenormal1.redPointSize(8).redPointColor([UIColor redColor]);
    BLSettingModel *md2  = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我是默认描述" showArrow:NO cellClickAction:nil];
    md2.cellH(45).cellClikedAction(^(BLSettingModel *model) {
        NSLog(@"%@", model.indexPath);
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    //设置显示小红点 并设置小红点样式
    md2.hintViewType(BLSettingNewFeatureHintTypeTextRedDot).style(stylenormal1);
    
    //开关样式
    BLSettingModel *md3 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES switchAction:^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    }];
    
    BLSettingModel *md4 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态关闭" switchIsOn:NO switchAction:nil];
    md4.switchAction(^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    });
    
    //segument
    BLSettingStyle *stylemh5 = [BLSettingStyle style];
    stylemh5.segumentItemW(40);
    BLSettingModel *md5 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"kg",@"斤",@"磅"] selectIndex:1 segumentAction:^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",segumentTitlsArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    }];
    md5.style(stylemh5);
    
    BLSettingStyle *stylemh6 = [BLSettingStyle style];
    stylemh6.segumentItemW(35);
    BLSettingModel *md6 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"kg",@"斤",@"磅"] selectIndex:1 segumentAction:nil];
    md6.segumentAction(^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",segumentTitlsArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    }).style(stylemh6);
    
    BLSettingStyle *stylemh7 = [BLSettingStyle style];
    stylemh7.contentLeftMargin(35)
    .contentRightMargin(35)
    .leftTitleSpaceToLeftIconMargin(5)
    .rightIconSpaceToRightArrowMargin(5);
    BLSettingModel *md7 =  [BLSettingFactory normalWithIcon:@"kehu_icon_niaotong" title:@"右侧图标展示箭头" rightIcon:@"kehu_icon_shijian" showArrow:YES cellClickAction:^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"右侧辅助视图");
            [weakSelf.tableView reloadData];
        });
    }];
    md7.style(stylemh7);
    
    BLSettingModel *md8 =  [BLSettingFactory normalWithIcon:@"kehu_icon_niaotong" title:@"右侧图标不显示箭头" rightIcon:@"kehu_icon_shijian" showArrow:YES cellClickAction:nil];
    md8.cellClikedAction(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"右侧辅助视图");
            [weakSelf.tableView reloadData];
        });
    });
    
    
    //自定义默认样式
    UIFont *font = [UIFont boldSystemFontOfSize:15];
    UIColor *color = [UIColor redColor];
    BLSettingStyle *style = [BLSettingStyle settingStyleWithTitleFont:font titleColor:color descFont:font descColor:color];
    BLSettingModel *md9 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认类型自定样式" detailTitle:@"我是默认描述" showArrow:YES cellClickAction:nil];
    md9.style(style);
    md9.cellClikedAction(^(BLSettingModel *model) {
        model.descTitle( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle( @"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style);
    
    
    //自定义开关样式
    UIFont *font1 = [UIFont boldSystemFontOfSize:18];
    UIColor *color1 = [UIColor blueColor];
    BLSettingStyle *style1 = [BLSettingStyle settingStyleWithTitleFont:font1 titleColor:color1 descFont:font1 descColor:color1 switchOnTintColor:color1];
    BLSettingModel *md10 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"开关自定义样式" switchIsOn:NO switchAction:nil];
    md10.cellClikedAction(^(BLSettingModel *model) {
        model.titleText( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.titleText( @"开关自定义样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style1);
    
    //自定义segment样式
    UIFont *font2 = [UIFont boldSystemFontOfSize:16];
    UIColor *color2 = [UIColor orangeColor];
    BLSettingStyle *style2 = [BLSettingStyle settingStyleWithTitleFont:font2 titleColor:color2 descFont:font2 descColor:color2 switchOnTintColor:color2];
    BLSettingModel *md11 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"Man",@"Weman",@"dog"] selectIndex:1 segumentAction:nil];
    md11.cellClikedAction(^(BLSettingModel *model) {
        model.descTitle( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle( @"自定义segment样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style2);
    
    //自定义segment样式
    UIFont *font3 = [UIFont boldSystemFontOfSize:12];
    UIColor *color3 = [UIColor purpleColor];
    BLSettingStyle *style3 = [BLSettingStyle settingStyleWithTitleFont:font3 titleColor:color3 descFont:font3 descColor:color3 switchOnTintColor:color3];
    style3.segumentNormalTextStyle(
                                   @{
                                     NSForegroundColorAttributeName:[UIColor yellowColor],
                                     NSFontAttributeName:[UIFont boldSystemFontOfSize:12]
                                     }).segumentSelectedTextStyle(
                                                                  @{
                                                                    NSForegroundColorAttributeName:[UIColor greenColor],
                                                                    NSFontAttributeName:[UIFont boldSystemFontOfSize:12]
                                                                    });
    BLSettingModel *md12 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"啤酒",@"可乐",@"橙汁"] selectIndex:1 segumentAction:nil];
    md12.segumentAction(^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"选择了%@",selectSwitchArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.titleText(@"自定义segment样式");
            [weakSelf.tableView reloadData];
        });
    }).style(style3);
    
    //链式语法创建自定义默认样式
    BLSettingStyle *style4 = [BLSettingStyle style]
    .leftTitleFontSize(18)
    .leftImageSize(CGSizeMake(100, 100))
    .rightImageSize(CGSizeMake(50, 50))
    .descTitleFontSize(10)
    .descTitleColor([UIColor redColor])
    .addLeftIconRadius(15);
    
    BLSettingModel *md13 = [BLSettingModel model]
    .titleText(@"我是通过链式语法实现")
    .descTitle(@"我是描述文字")
    .showArrow(YES)
    .style(style4)
    .cellClikedAction(^(BLSettingModel *model) {
        model.titleText(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.titleText(@"我是通过链式语法实现");
            [weakSelf.tableView reloadData];
        });
    });
    
    BLSettingModel *md14 = [BLSettingFactory textFieldWithIcon:@"kehu_icon_kaluli" title:@"文本框" placeHolder:@"感觉胖了 用变啦" textMaxLength:4 didChangeAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"文本框文字发生改变");
    } reachesMaxLengthAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"您输入的文字已经达到最大长度");
    }];
    
    BLSettingModel *md15 = [BLSettingFactory textFieldWithIcon:nil title:@"文本框" placeHolder:@"感觉胖了 用变啦" textMaxLength:12 didChangeAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"文本框文字发生改变");
    } reachesMaxLengthAction:^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"您输入的文字已经达到最大长度");
    }];
    
    //链式语法创建自定义默认样式
    BLSettingStyle *style5 = [BLSettingStyle style]
    .textFieldTextColor(BLSETTINGHEXCOLOR(0x666666))
    .textFieldTextFont([UIFont systemFontOfSize:16])
    .textFieldPlaceHolderColor([UIColor redColor])
    .textFieldPlaceHolderFont([UIFont systemFontOfSize:20]);
    
    BLSettingModel *md16 =  [BLSettingModel model];
    md16.type(BLSettingCellTypeRightTextField)
    .leftIconName(@"kehu_icon_kaluli").titleText(@"文本框自定义样式").textFieldPlaceHolder(nil)
    .textFieldTextMaxLength(20).textFieldDidChangeAction(^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"文本框文字发生改变");
    }).textFieldTextReachesMaxLengthAction(^(BLSettingModel *model, UITextField *textField) {
        NSLog(@"您输入的文字已经达到最大长度");
    }).style(style5);
    
    
    BLSettingStyle *md17Sytle = [BLSettingStyle style];
    md17Sytle.avaterDescSpaceToCellCenterYMargin(40);
    BLSettingModel *md17 = [BLSettingFactory avaterWithIcon:@"kehu_icon_kaluli" title:@"个人头像资料" detailTitle:@"显示箭头" isShowArrow:YES cellClickAction:^(BLSettingModel *model) {
        NSLog(@"点我干嘛");
    }];
    md17.cellH(100).rightIconName(@"kehu_icon_kaluli").style(md17Sytle);
    
    BLSettingModel *md18 = [BLSettingFactory avaterWithIcon:@"kehu_icon_kaluli" title:@"个人头像资料" detailTitle:@"隐藏箭头" isShowArrow:NO cellClickAction:^(BLSettingModel *model) {
        NSLog(@"点我干嘛");
    }];
    md18.cellH(100).rightIconName(@"kehu_icon_kaluli");
    
    BLSettingStyle *segStyle = [BLSettingStyle style];
    segStyle.segumentClearRadius(YES).segumentBorderWidth(0.2).segumentClearDivider(YES);
    BLSettingModel *md19 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"舒少勇666",@"迪丽热巴777"] selectIndex:1 segumentAction:nil];
    md19.segumentAction(^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.descTitle(segumentTitlsArr[selectIndex]);
        [weakSelf.tableView reloadData];
    }).style(segStyle);
    
    BLSettingStyle *segStyle1 = [BLSettingStyle style];
    segStyle1.segumentClearRadius(NO).segumentBorderWidth(0);
    BLSettingModel *md20 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"Man",@"Weman",@"dog"] selectIndex:1 segumentAction:nil];
    md20.segumentAction(^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.descTitle(segumentTitlsArr[selectIndex]);
        [weakSelf.tableView reloadData];
    }).style(segStyle1);
    
    BLSettingStyle *segStyle2 = [BLSettingStyle style];
    segStyle2.segumentClearRadius(YES).segumentBorderWidth(5);
    BLSettingModel *md21 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"Man",@"Weman",@"dog"] selectIndex:1 segumentAction:nil];
    md21.segumentAction(^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.descTitle(segumentTitlsArr[selectIndex]);
        [weakSelf.tableView reloadData];
    }).style(segStyle2);
    
    BLSettingStyle *segStyle3 = [BLSettingStyle style];
    segStyle3.segumentClearRadius(YES).segumentBorderWidth(0);
    BLSettingModel *md22 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" segumentTitleArr:@[@"Man",@"Weman",@"dog"] selectIndex:1 segumentAction:nil];
    md22.segumentAction(^(BLSettingModel *model, NSArray *segumentTitlsArr, NSInteger selectIndex) {
        model.descTitle(segumentTitlsArr[selectIndex]);
        [weakSelf.tableView reloadData];
    }).style(segStyle3);
    
    
    
    BLSettingModel *md0002 =  [BLSettingFactory normalWithIcon:@"kehu_icon_niaotong" title:@"右侧图标展示箭头" rightIcon:@"kehu_icon_shijian" showArrow:YES cellClickAction:^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
    }];
    //    md0002.rightIconImage([UIImage imageNamed:@"man_no_select"]).rightIconName(@"kehu_icon_niaotong");
    md0002.rightIconNormalSelImageName(^(NSString *__autoreleasing *normalImage, NSString *__autoreleasing *selectedImage) {
        *normalImage = @"man_no_select";
        *selectedImage = @"edit_man_click";
    });
    
    //默认样式
    //创建性别大图选择类型样式
    //    BLSettingStyle *style0001 = [BLSettingStyle style];
    BLSettingModel *md0001 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我是默认描述" showArrow:YES cellClickAction:nil];
    md0001.cellH(120).cellClikedAction(^(BLSettingModel *model) {
        NSLog(@"%@", model.indexPath);
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    md0001.leftIconNormalSelImageName(^(NSString *__autoreleasing *normalImage, NSString *__autoreleasing *selectedImage) {
        *normalImage = @"man_no_select";
        *selectedImage = @"edit_man_click";
    });

    
    BLSettingGroup *group1 = [[BLSettingGroup alloc] init];
    group1.header = @"第一组";
    group1.items = @[md0001,model0,md20,md21,md22,md001,model000,model00,model01];
    
    BLSettingGroup *group2 = [[BLSettingGroup alloc] init];
    group2.header = @"第二组";
    group2.footer = @"第二组尾部";
    group2.items = @[md0002,model00,md19,md18,md17,md16,md15];


    BLSettingGroup *group3 = [[BLSettingGroup alloc] init];
    group3.header = @"第三组";
    group3.footer = @"第三组尾部";
    group3.items = @[model02,model0,model0,md14,md13,md12,md11,md10,md9,md8];


    BLSettingGroup *group4 = [[BLSettingGroup alloc] init];
    group4.header = @"第四组";
    group4.items = @[modelsex0,modelsex1,md7,md6,md5,md4,md3,md2,md1];
    
    [self.datas addObject:group1];
    [self.datas addObject:group2];
    [self.datas addObject:group3];
    [self.datas addObject:group4];

}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    BLSettingGroup *group = self.datas[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLSettingGroup *group = self.datas[indexPath.section];
    BLSettingModel *settM = group.items[indexPath.row];
    BLSettingBaseCell *cell = [BLSettingFactory createCellWithTableView:tableView model:settM indexPath:indexPath];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    BLSettingGroup *group = self.datas[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    BLSettingGroup *group = self.datas[section];
    return group.footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLSettingGroup *group = self.datas[indexPath.section];
    BLSettingModel *settM = group.items[indexPath.row];
    if (settM.cellHeight > 0) {
        return settM.cellHeight;
    }
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    BLSettingGroup *group = self.datas[section];
    if (group.header) {
        return 25;
    }else{
        return 0.001f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    BLSettingGroup *group = self.datas[section];
    if (group.footer) {
        return 25;
    }else{
        return 0.001f;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            _fpsLabel.alpha = 1;
        } completion:NULL];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (_fpsLabel.alpha != 0) {
            [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                _fpsLabel.alpha = 0;
            } completion:NULL];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha != 0) {
        [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            _fpsLabel.alpha = 0;
        } completion:NULL];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            _fpsLabel.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    }
}

@end

