//
//  JLSetItemModel.m
//  我的控件集合
//
//  Created by Wangjianlong on 16/1/7.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import "JLSetItem.h"
@implementation JLSetItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    JLSetItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}


+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}


@end
