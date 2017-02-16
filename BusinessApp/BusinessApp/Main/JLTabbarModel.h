//
//  JLTabbarModel.h
//  我的控件集合
//
//  Created by Wangjianlong on 16/1/7.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLTabbarModel : NSObject
/**控制器类*/
@property (nonatomic, strong)Class VcClass;

/**图片*/
@property (nonatomic, strong)UIImage *tabbarImage;

/**名称*/
@property (nonatomic, copy)NSString *tabbarTitle;

@end
