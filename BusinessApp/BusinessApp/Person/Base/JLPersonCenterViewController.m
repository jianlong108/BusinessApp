//
//  JLPersonCenterViewController.m
//  我的控件集合
//
//  Created by Wangjianlong on 16/1/8.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import "JLPersonCenterViewController.h"

#import "RegistAndLoginViewController.h"
#import "JLSetViewController.h"
#import "JLSettingViewController.h"
@implementation JLPersonCenterViewController
/**
 *  第0组数据
 */
- (void)setupGroup0
{
    
    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"tabBar_me_icon" title:@"我的订单" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice1 = [JLSetArrowItem itemWithIcon:@"tabBar_me_icon" title:@"购物车" destVcClass:[JLSetViewController class]];
    
    
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 10;
    group.footerHeight = 10;
    group.items = @[pushNotice,pushNotice1];
    [self.data addObject:group];
}
- (void)setupGroup1
{
    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"tabBar_me_icon" title:@"我参与的" destVcClass:[JLSetViewController class]];
    
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 10;
    group.footerHeight = 10;
    group.items = @[pushNotice];
    [self.data addObject:group];
}
- (void)setupGroup2
{
    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"tabBar_me_icon" title:@"设置" destVcClass:[JLSetViewController class]];
    
    
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 10;
    group.footerHeight = 10;
    group.items = @[pushNotice];
    [self.data addObject:group];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    // 2.添加数据
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}
- (void)entryLoginVc{
    RegistAndLoginViewController *vc = [[RegistAndLoginViewController alloc]init];
    NSLog(@"%@",self.navigationController);
    [self.navigationController pushViewController:vc animated:YES];
}
@end
