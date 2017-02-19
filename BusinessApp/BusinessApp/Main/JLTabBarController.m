//
//  JLTabBarController.m
//  我的控件集合
//
//  Created by Wangjianlong on 16/1/7.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import "JLTabBarController.h"
#import "JLNaviagationController.h"
#import "JLTabbarModel.h"
#import "JLPersonCenterViewController.h"
#import "BoutiqueViewController.h"
#import "HomeViewController.h"
@interface JLTabBarController ()<JLTabBarDelegate>

@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, assign) int lastTabbarIndex;

@end

@implementation JLTabBarController


- (NSArray *)dataArray{
    if (_dataArray == nil) {
        JLTabbarModel *m_home = [[JLTabbarModel alloc]init];
        m_home.VcClass = [HomeViewController class];
        m_home.tabbarImage = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
        m_home.tabbarTitle = @"活动";
        
        JLTabbarModel *m_boutique = [[JLTabbarModel alloc]init];
        m_boutique.VcClass = [BoutiqueViewController class];
        m_boutique.tabbarTitle = @"精品";
        m_boutique.tabbarImage = [UIImage imageNamed:@"tabBar_essence_icon"];
        
        JLTabbarModel *m_person = [[JLTabbarModel alloc]init];
        m_person.VcClass = [JLPersonCenterViewController class];
        m_person.tabbarTitle = @"我的";
        m_person.tabbarImage = [UIImage imageNamed:@"tabBar_essence_icon"];
        _dataArray = @[m_home,m_boutique,m_person];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubControllers];
}
//- (void)tabBar:(JLTabbar *)tabBar DidClickedButton:(UIButton *)btn{
//    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Service" bundle:nil];
//    UIViewController *vc = sb.instantiateInitialViewController;
//    [self presentViewController:vc animated:YES completion:nil];
//    
//}

- (void)setUpSubControllers{
    for (int i = 0; i<self.dataArray.count;i++) {
        JLTabbarModel *model = self.dataArray[i];
        [self addVcWithVC:model.VcClass normalImage:model.tabbarImage SelectedImage:model.tabbarImage Title:model.tabbarTitle Tag:i];
    }
    
}
- (void)addVcWithVC:(Class)ViewControllerClass normalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage Title:(NSString *)title Tag:(NSUInteger)tag{
    
    UIViewController *vc = [[ViewControllerClass alloc]init];
    vc.title = title;
    vc.tabBarItem.tag = tag;
    vc.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary *nDic = [[NSMutableDictionary alloc]init];
    nDic[NSForegroundColorAttributeName] =[UIColor blackColor];
    
    
    NSMutableDictionary *sDic = [[NSMutableDictionary alloc]init];
    sDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [vc.tabBarItem setTitleTextAttributes:sDic forState:UIControlStateSelected];
    [vc.tabBarItem setTitleTextAttributes:nDic forState:UIControlStateNormal];
    
    JLNaviagationController *nav = [[JLNaviagationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

+ (UIImage *)capture
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7) {
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, window.opaque, 0.0);
        [window.rootViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return img;
    }
    
    CGSize imageSize = CGSizeZero;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        imageSize = [UIScreen mainScreen].bounds.size;
    } else {
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    }
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft) {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        } else if (orientation == UIInterfaceOrientationLandscapeRight) {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
            /*!
             @brief afterScreenUpdates 必须设置成NO  否则css 动画不执行
             */
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:NO];
        } else {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
