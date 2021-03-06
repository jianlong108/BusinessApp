//
//  JLSetGroupModel.h
//  我的控件集合
//
//  Created by Wangjianlong on 16/1/7.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JLSetItem;
@interface JLSetGroupModel : NSObject
/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *header;
/**
 *  尾部标题
 */
@property (nonatomic, copy) NSString *footer;
/**头部高度*/
@property (nonatomic, assign)CGFloat headerHeight;
/**尾部高度*/
@property (nonatomic, assign)CGFloat footerHeight;
/**
 *  存放着这组所有行的模型数据(这个数组中都是JLSetItemModel对象)
 */
@property (nonatomic, copy) NSArray<JLSetItem *> *items;
@end
