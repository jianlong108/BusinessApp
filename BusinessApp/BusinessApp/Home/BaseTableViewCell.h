//
//  BaseTableViewCell.h
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/19.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellBaseModelProtocol.h"

@interface BaseTableViewCell : UITableViewCell


/**
 cell依赖的model
 */
@property(nonatomic,strong)id<CellBaseModelProtocol> dataModel;

/*
**
*  创建cell上的子视图  子类需重写此方法
*/
- (void)initializeSubViews;

/**
 *  布局cell上的子视图的位置  子类需重写此方法
 */
- (void)layoutContentView;

/**
 *  清除复用数据
 */
- (void)clearData;

@end
