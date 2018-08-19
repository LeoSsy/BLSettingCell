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
   

//    BLSettingGroup *group1 = [[BLSettingGroup alloc] init];
//    group1.header = @"第一组";
//    group1.items = @[md27,md26,md25,md24,md23,md22,md21,md20];
//    
//    BLSettingGroup *group2 = [[BLSettingGroup alloc] init];
//    group2.header = @"第二组";
//    group2.footer = @"第二组尾部";
//    group2.items = @[md19,md18,md17,md16,md15];
//    
//    
//    BLSettingGroup *group3 = [[BLSettingGroup alloc] init];
//    group3.header = @"第三组";
//    group3.footer = @"第三组尾部";
//    group3.items = @[md14,md13,md12,md11,md10,md9,md8];
//    
//    
//    BLSettingGroup *group4 = [[BLSettingGroup alloc] init];
//    group4.header = @"第四组";
//    group4.items = @[md7,md6,md5,md4,md3,md2,md1];
//    
//    [self.datas addObject:group1];
//    [self.datas addObject:group2];
//    [self.datas addObject:group3];
//    [self.datas addObject:group4];

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

