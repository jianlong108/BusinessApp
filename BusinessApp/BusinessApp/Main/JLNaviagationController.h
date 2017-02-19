//
//  JLNaviagationController.h
//  JLApp
//
//  Created by Wangjianlong on 16/1/7.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JLNaviagationControllerDelegate <NSObject>

@optional
/*!
 @method
 @abstract   收到手势事件
 @discussion 收到手势事件
 @param      recoginzer 触发手势事件的手势识别器
 */
- (void)JLNavigationPaningGesture:(UIPanGestureRecognizer *)recoginzer;
/*!
 @method
 @abstract   手势返回事件
 @discussion 手势返回事件
 */
- (void)JLNavigationBack;

@end

/*!
 @class
 @abstract 封装手势返回的NavigationController基类
 */
@interface JLNaviagationController : UINavigationController<UIGestureRecognizerDelegate>

/*!
 @property
 @abstract 开启滑动返回手势支持, 默认开启.
 */
@property (nonatomic,assign) BOOL canDragBack;
/*!
 @property
 @abstract 是否开启手势
 */
@property (nonatomic,assign,getter=isOpenGesture) BOOL openGesture;
/*!
 @property
 @abstract 是否开启多手势支持
 */
@property (nonatomic,assign,getter=isMultiGuesture) BOOL multiGuesture;
/*!
 @property
 @abstract 用于手势返回
 */
@property (nonatomic,strong)UIPanGestureRecognizer *recognizer;
/*!
 @property
 @abstract 委托
 */
@property (nonatomic,weak) id<JLNaviagationControllerDelegate> navdelegate;

@end

