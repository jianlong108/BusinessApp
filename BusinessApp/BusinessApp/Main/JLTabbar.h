//
// 文 件 名: JLTabbar.h
// 工 程 名: vehicle
// 文件描述:
// 作   者: 王建龙
// 创作日期: 15/6/19.
//  Copyright (c) 2015年 autohome. All rights reserved.


#import <UIKit/UIKit.h>

@class JLTabbar;
@protocol JLTabBarDelegate <UITabBarDelegate,NSObject>

@optional
- (void)tabBar:(JLTabbar *)tabBar DidClickedButton:(UIButton *)btn;

@end

@interface JLTabbar : UITabBar

@property (nonatomic, weak) id<JLTabBarDelegate> delegate;
- (void)addsubBtnWithItem:(UITabBarItem *)item;

@end
