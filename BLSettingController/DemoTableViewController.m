//
//  DemoTableViewController.m
//  BaseSettingCellExample
//
//  Created by Jack on 2018/5/10.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "DemoTableViewController.h"
#import "BLSetting.h"

@interface DemoTableViewController ()
@property(nonatomic,strong)NSMutableArray *datas;
@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    //默认样式
    BLSettingModel *md1 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我是默认描述"];
    md1.showRedDot(YES).cellH(120).cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    
    BLSettingModel *md2 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我不显示箭头哦"  isShowArrow:NO];
    
    BLSettingModel *md3 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我显示箭头哦"  isShowArrow:YES];
    
    BLSettingModel *md4 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我不显示图标哦"  isShowArrow:NO];
    
    BLSettingModel *md5 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我显示图标哦"  isShowArrow:YES];
    
    //标准样式
    BLSettingModel *md6 = [BLSettingFactory standardWithIcon:nil title:@"我是标准样式----" detailTitle:@"我是默认描述"];
    
    BLSettingModel *md7 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式" detailTitle:@"我不显示图标" ];
    
    BLSettingModel *md8 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式我没有描述" detailTitle:nil ];
    
    BLSettingModel *md9 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式" detailTitle:@"我不显示图标哦" ];
    
    BLSettingModel *md10 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式" detailTitle:@"我显示图标哦"];
    md10.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我显示图标");
            [weakSelf.tableView reloadData];
        });
    });

    //开关样式
    BLSettingModel *md11 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md11.switchOperation(^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    });
    
    BLSettingModel *md12 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态关闭" switchIsOn:NO];
    md12.switchOperation(^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    });
    
    //segument
    BLSettingModel *md13 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:1];
    md13.segumentOperation(^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    });

    
    BLSettingModel *md14 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:0];
    md14.segumentOperation(^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    });

    BLSettingModel *md15 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:1];
    md15.segumentOperation(^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    });
    
    BLSettingModel *md16 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:2];
    md16.segumentOperation(^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
    });
    
    BLSettingModel *md17 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md17.switchOperation(^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    });

    BLSettingModel *md18 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md18.switchOperation(^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    });
    BLSettingModel *md19 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md19.switchOperation(^(BLSettingModel *model, BOOL switchIsOn) {
        model.titleText([NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"]) ;
        [weakSelf.tableView reloadData];
    });
    
    BLSettingModel *md20 = [BLSettingFactory rightAssistWithIcon:@"kehu_icon_niaotong" title:@"右侧辅助视图" detailTitle:@"右侧描述" rightIcon:@"kehu_icon_shijian"];
    md20.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"右侧辅助视图");
            [weakSelf.tableView reloadData];
        });
    });

    
    //默认样式
    BLSettingModel *md21 = [BLSettingFactory avaterWithIcon:@"kehu_icon_jihua" title:@"王哈哈" detailTitle:@"我是明星健身房健身达人" isShowArrow:NO];
    md21.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle(@"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle(@"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });
    
    //自定义默认样式
    UIFont *font = [UIFont boldSystemFontOfSize:15];
    UIColor *color = [UIColor redColor];
    BLSettingStyle *style = [BLSettingStyle settingStyleWithTitleFont:font titleColor:color descFont:font descColor:color];
    BLSettingModel *md22 = [BLSettingFactory normalWithIcon:nil title:@"自定义默认样式" detailTitle:@"nineteen" isShowArrow:YES settingStyle:style];
    md22.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle( @"我是默认样式");
            [weakSelf.tableView reloadData];
        });
    });

    
    //自定义开关样式
    UIFont *font1 = [UIFont boldSystemFontOfSize:18];
    UIColor *color1 = [UIColor blueColor];
    BLSettingStyle *style1 = [BLSettingStyle settingStyleWithTitleFont:font1 titleColor:color1 descFont:font1 descColor:color1 switchOnTintColor:color1];
    BLSettingModel *md23 = [BLSettingFactory switchWithIcon:nil title:@"自定义开关样式" switchIsOn:YES settingStyle:style1];
    md23.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle( @"自定义开关样式");
            [weakSelf.tableView reloadData];
        });
    });
    
    //自定义segment样式
    UIFont *font2 = [UIFont boldSystemFontOfSize:20];
    UIColor *color2 = [UIColor orangeColor];
    BLSettingStyle *style2 = [BLSettingStyle settingStyleWithTitleFont:font2 titleColor:color2 descFont:font2 descColor:color2 switchOnTintColor:color2];
    BLSettingModel *md24 = [BLSettingFactory segumentWithIcon:nil title:@"自定义segment样式" selectSwitchArr:@[@"Yes",@"No"] selectIndex:1 settingStyle:style2];
    md24.cellClikedOperation(^(BLSettingModel *model) {
        model.descTitle( @"我被点击了");
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.descTitle( @"自定义segment样式");
            [weakSelf.tableView reloadData];
        });
    });
    
    //自定义segment样式
    UIFont *font3 = [UIFont boldSystemFontOfSize:20];
    UIColor *color3 = [UIColor purpleColor];
    BLSettingStyle *style3 = [BLSettingStyle settingStyleWithTitleFont:font3 titleColor:color3 descFont:font3 descColor:color3 switchOnTintColor:color3];
    style3.segumentNormalTextStyle(
   @{
    NSForegroundColorAttributeName:[UIColor yellowColor],
    NSFontAttributeName:[UIFont boldSystemFontOfSize:16]
    }).segumentSelectedTextStyle(
  @{
      NSForegroundColorAttributeName:[UIColor greenColor],
    NSFontAttributeName:[UIFont boldSystemFontOfSize:18]
    })
    BLSettingModel *md25 = [BLSettingFactory segumentWithIcon:nil title:@"自定义segment样式" selectSwitchArr:@[@"Yes",@"No"] selectIndex:1 settingStyle:style3];
    md25.segumentOperation(^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.titleText([NSString stringWithFormat:@"选择了%@",selectSwitchArr[selectIndex]]) ;
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.titleText(@"自定义segment样式");
            [weakSelf.tableView reloadData];
        });
    });

    BLSettingModel *md26 = [BLSettingFactory rightAssistWithIcon:nil title:@"更改头像" detailTitle:nil rightIcon:@"IMG_2604_"];


    //链式语法创建自定义默认样式
//    UIFont *font = [UIFont boldSystemFontOfSize:15];
//    UIColor *color = [UIColor redColor];
    BLSettingStyle *style4 = [BLSettingStyle settingStyleWithTitleFont:font titleColor:color descFont:font descColor:color];
    style4.leftTitleFontSize(18).leftImageSize(CGSizeMake(100, 100)).rightImageSize(CGSizeMake(50, 50)).descTitleFontSize(10).descTitleColor([UIColor redColor]).addLeftIconRadius(15);
    BLSettingModel *md27 = [BLSettingFactory normalWithIcon:nil title:@"链式语法创建自定义默认样式" detailTitle:@"nineteen" isShowArrow:YES settingStyle:style4];
    md27.cellOperationBlock = ^(BLSettingModel *model) {
        model.title = @"我被点击了";
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.title = @"链式语法创建自定义默认样式";
            [weakSelf.tableView reloadData];
        });
    };
    md27.cellHeight = 120;
    
    [self.datas addObject:md27];
    [self.datas addObject:md26];
    [self.datas addObject:md25];
    [self.datas addObject:md24];
    [self.datas addObject:md23];
    [self.datas addObject:md22];
    [self.datas addObject:md21];
    [self.datas addObject:md1];
    [self.datas addObject:md20];
    [self.datas addObject:md16];
    [self.datas addObject:md2];
    [self.datas addObject:md3];
    [self.datas addObject:md4];
    [self.datas addObject:md5];
    [self.datas addObject:md6];
    [self.datas addObject:md7];
    [self.datas addObject:md8];
    [self.datas addObject:md9];
    [self.datas addObject:md10];
    [self.datas addObject:md11];
    [self.datas addObject:md12];
    [self.datas addObject:md13];
    [self.datas addObject:md14];
    [self.datas addObject:md17];
    [self.datas addObject:md18];
    [self.datas addObject:md19];
    [self.datas addObject:md15];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (BLSettingBaseCell *)extracted:(BLSettingModel *)settM tableView:(UITableView * _Nonnull)tableView {
    BLSettingBaseCell *cell = [BLSettingFactory createCellWithTableView:tableView model:settM];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLSettingModel *settM = self.datas[indexPath.row];
    BLSettingBaseCell * cell = [self extracted:settM tableView:tableView];
    [cell configModel:settM];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    BLSettingModel *settM = self.datas[indexPath.row];
    if (settM.cellHeight > 0) {
        return settM.cellHeight;
    }
    return 55;
}

@end
