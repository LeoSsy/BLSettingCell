//
//  DemoTableViewController.m
//  BaseSettingCellExample
//
//  Created by Jack on 2018/5/10.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import "DemoGroupTableViewController.h"
#import "BLSetting.h"

@interface DemoGroupTableViewController ()
@property(nonatomic,strong)NSMutableArray *datas;
@end

@implementation DemoGroupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _datas = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    //默认样式
    BLSettingModel *md1 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我是默认描述"];
    md1.isShowUnderLine = NO;
    md1.isShowRedPoint = YES;
    md1.cellOperationBlock = ^(BLSettingModel *model) {
        model.detailTitle = @"我被点击了";
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.detailTitle = @"我是默认样式";
            [weakSelf.tableView reloadData];
        });
    };
    
    BLSettingModel *md2 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我不显示箭头哦"  isShowArrow:NO];
    
    BLSettingModel *md3 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我显示箭头哦"  isShowArrow:YES];
    
    BLSettingModel *md4 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我不显示图标哦"  isShowArrow:NO];
    
    BLSettingModel *md5 = [BLSettingFactory normalWithIcon:@"kehu_icon_jihua" title:@"我是默认样式" detailTitle:@"我显示图标哦"  isShowArrow:YES];
    
    //标准样式
    BLSettingModel *md6 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式" detailTitle:@"我是默认描述"];
    
    BLSettingModel *md7 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式" detailTitle:@"我不显示图标" ];
    
    BLSettingModel *md8 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式我没有描述" detailTitle:nil] ;
    
    BLSettingModel *md9 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式" detailTitle:@"我不显示图标哦" ];
    
    BLSettingModel *md10 = [BLSettingFactory standardWithIcon:@"kehu_icon_jihua" title:@"我是标准样式" detailTitle:@"我显示图标哦" ];
    md10.cellOperationBlock = ^(BLSettingModel *model) {
        model.detailTitle = @"我被点击了";
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.detailTitle = @"我显示图标哦";
            [weakSelf.tableView reloadData];
        });
    };
    
    
    //开关样式
    BLSettingModel *md11 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md11.cellSwitchBlock = ^(BLSettingModel *model, BOOL switchIsOn) {
        model.title = [NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"];
        [weakSelf.tableView reloadData];
    };
    
    BLSettingModel *md12 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态关闭" switchIsOn:NO];
    md12.cellSwitchBlock = ^(BLSettingModel *model, BOOL switchIsOn) {
        model.title = [NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"];
        [weakSelf.tableView reloadData];
    };
    
    //segument
    BLSettingModel *md13 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:1];
    md13.cellSegumentBlock = ^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.title = [NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]];
        [weakSelf.tableView reloadData];
    };
    
    BLSettingModel *md14 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:0];
    md14.cellSegumentBlock = ^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.title = [NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]];
        [weakSelf.tableView reloadData];
    };
    
    BLSettingModel *md15 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:1];
    md15.cellSegumentBlock = ^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.title = [NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]];
        [weakSelf.tableView reloadData];
    };
    
    BLSettingModel *md16 = [BLSettingFactory segumentWithIcon:@"kehu_icon_kaluli" title:@"我是segument" selectSwitchArr:@[@"kg",@"斤",@"磅"] selectIndex:2];
    md16.cellSegumentBlock = ^(BLSettingModel *model, NSArray *selectSwitchArr, NSInteger selectIndex) {
        model.title = [NSString stringWithFormat:@"你选择了%@",selectSwitchArr[selectIndex]];
        [weakSelf.tableView reloadData];
    };
    
    BLSettingModel *md17 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md17.cellSwitchBlock = ^(BLSettingModel *model, BOOL switchIsOn) {
        model.title = [NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"];
        [weakSelf.tableView reloadData];
    };
    
    BLSettingModel *md18 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md18.cellSwitchBlock = ^(BLSettingModel *model, BOOL switchIsOn) {
        model.title = [NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"];
        [weakSelf.tableView reloadData];
    };
    BLSettingModel *md19 = [BLSettingFactory switchWithIcon:@"kehu_icon_jilu2" title:@"我的状态开启" switchIsOn:YES];
    md19.cellSwitchBlock = ^(BLSettingModel *model, BOOL switchIsOn) {
        model.title = [NSString stringWithFormat:@"我的状态%@",switchIsOn?@"开启":@"关闭"];
        [weakSelf.tableView reloadData];
    };
    
    BLSettingModel *md20 = [BLSettingFactory rightAssistWithIcon:@"kehu_icon_niaotong" title:@"右侧辅助视图" detailTitle:@"右侧描述" rightIcon:@"kehu_icon_shijian"];
    md20.cellOperationBlock = ^(BLSettingModel *model) {
        model.detailTitle = @"我被点击了";
        [weakSelf.tableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            model.detailTitle = @"右侧辅助视图";
            [weakSelf.tableView reloadData];
        });
    };


    BLSettingGroup *group1 = [[BLSettingGroup alloc] init];
    group1.header = @"第一组";
    group1.items = @[md1,md2,md3,md4,md5,md20];
    
    BLSettingGroup *group2 = [[BLSettingGroup alloc] init];
    group2.header = @"第二组";
    group2.footer = @"第二组尾部";
    group2.items = @[md6,md7,md8,md9,md10];
    
    
    BLSettingGroup *group3 = [[BLSettingGroup alloc] init];
    group3.header = @"第三组";
    group3.footer = @"第三组尾部";
    group3.items = @[md11,md12,md13,md14,md15];
    
    
    BLSettingGroup *group4 = [[BLSettingGroup alloc] init];
    group4.header = @"第四组";
    group4.items = @[md16,md17,md18,md19];
    
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
    BLSettingBaseCell *cell = [BLSettingFactory createCellWithTableView:tableView model:settM];
    [cell configModel:settM];
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

@end

