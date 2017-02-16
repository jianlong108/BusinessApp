//
//  JLSetViewController.m
//  我的控件集合
//
//  Created by Wangjianlong on 16/1/7.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import "JLSetViewController.h"
//#import "SVProgressHUD.h"

@implementation JLSetViewController
/**
 *  第1组数据
 */
- (void)setupGroup1
{
    JLSetItem *update = [JLSetArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.option = ^{
//        // 弹框提示
//        [SVProgressHUD showSuccessWithStatus:@"正在拼命检查中....."];
//        
//
//        // 几秒后消失
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 移除HUD
//            [SVProgressHUD dismiss];
//            
//            // 提醒有没有新版本
//            [SVProgressHUD showErrorWithStatus:@"没有新版本"];
//        });
    };
    JLSetItem *help = [JLSetArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[UIViewController class]];
    JLSetItem *share = [JLSetArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[UIViewController class]];
    JLSetItem *viewMsg = [JLSetArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[UIViewController class]];
    JLSetItem *product = [JLSetArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[UIViewController class]];
    JLSetItem *about = [JLSetArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[UIViewController class]];
    
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 20;
    group.items = @[update, help, share, viewMsg, product, about];
    [self.data addObject:group];
}

/**
 *  第0组数据
 */
- (void)setupGroup0
{
    JLSetItem *pushNotice = [JLSetArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[UIViewController class]];
    JLSetItem *handShake = [JLSetSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    JLSetItem *soundEffect = [JLSetSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    JLSetGroupModel *group = [[JLSetGroupModel alloc] init];
    group.headerHeight = 40;
    group.items = @[pushNotice, handShake, soundEffect];
    [self.data addObject:group];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.标题
    self.title = @"设置";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(nextVc)];
    // 2.添加数据
    [self setupGroup0];
    [self setupGroup1];
}
- (void)nextVc{
    
}
@end
