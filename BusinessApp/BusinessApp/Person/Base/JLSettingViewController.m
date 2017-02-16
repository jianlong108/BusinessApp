//
//  JLSettingViewController.m
//  我的控件集合
//
//  Created by Wangjianlong on 16/1/8.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import "JLSettingViewController.h"
#import "JLSetViewController.h"

@implementation JLSettingViewController
/**
 *  第0组数据
 */
- (void)setupGroup0
{
    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"账号绑定" destVcClass:[JLSetViewController class]];
    
    //    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[JLSetViewController class]];
    //    JLSetItem *handShake = [JLSetSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    //    JLSetItem *soundEffect = [JLSetSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 20;
    group.items = @[pushNotice];
    [self.data addObject:group];
}
- (void)setupGroup1
{
    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"正文字号" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice1 = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"小图模式" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice2 = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"推送设置" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice3 = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"清除缓存" destVcClass:[JLSetViewController class]];
    
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 20;
    group.items = @[pushNotice,pushNotice1,pushNotice2,pushNotice3];
    [self.data addObject:group];}
- (void)setupGroup2
{
    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"意见反馈" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice1 = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"常见问题" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice2 = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"去AppStore给个5星吧" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice3 = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"检测更新" destVcClass:[JLSetViewController class]];
    JLSetItem *pushNotice4 = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"关于汽车之家" destVcClass:[JLSetViewController class]];
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 20;
    group.items = @[pushNotice,pushNotice1,pushNotice2,pushNotice3,pushNotice4];
    [self.data addObject:group];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.标题
    self.title = @"设置";
    
    // 2.添加数据
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}

@end
