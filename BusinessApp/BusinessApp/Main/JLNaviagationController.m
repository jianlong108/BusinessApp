//
//  JLNaviagationController.m
//  JLApp
//
//  Created by Wangjianlong on 16/1/7.
//  Copyright © 2016年 autohome. All rights reserved.
//

#import "JLNaviagationController.h"
#import "JLNavigationBar.h"

@interface JLNaviagationController ()<UINavigationBarDelegate>
{
    CGPoint          startTouch;
    UIImageView     *lastScreenShotView;
    UIView          *blackMask;
}

@property (nonatomic,strong) UIView         *backgroundView;
@property (nonatomic,strong) NSMutableArray *screenShotsList;
@property (nonatomic,assign) BOOL            isMoving;

@end

@implementation JLNaviagationController
#pragma mark - initize color -
+ (void)initialize
{
    // 设置UINavigationBarTheme的主
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置UINavigationBarTheme的主题
 */
+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    if ([[UIDevice currentDevice].systemVersion doubleValue] <= 6.0) {
        textAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
        textAttrs[UITextAttributeTextShadowOffset] =[[NSShadow alloc]init];
    }else {
        textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
        textAttrs[NSShadowAttributeName] = [[NSShadow alloc]init];
    }
    [appearance setTitleTextAttributes:textAttrs];
    
}

/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme
{
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    if ([[UIDevice currentDevice].systemVersion doubleValue] < 7.0) {
        textAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
        textAttrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:17];
        textAttrs[UITextAttributeTextShadowOffset] =[[NSShadow alloc]init];
    }else {
        textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
        textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
        textAttrs[NSShadowAttributeName] = [[NSShadow alloc]init];
    }
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
}
#pragma mark - life cycle -
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUpFunction];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setUpFunction];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUpFunction];
    }
    return self;
}
- (void)setUpFunction{
    self.canDragBack = YES;
    self.openGesture = YES;
}
- (NSMutableArray *)screenShotsList{
    if (_screenShotsList == nil) {
        _screenShotsList = [[NSMutableArray alloc]initWithCapacity:2];
    }
    return _screenShotsList;
}

#pragma mark - InterfaceOrientations -

- (UIInterfaceOrientationMask)supportedInterfaceOrientations

{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000
    return (UIInterfaceOrientationMaskPortrait);
#else
    return 0;
#endif
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    self.navdelegate = nil;
    if (lastScreenShotView != nil)
    {
        [lastScreenShotView removeFromSuperview];
        lastScreenShotView = nil;
    }
    if (self.backgroundView != nil)
    {
        [self.backgroundView removeFromSuperview];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _recognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(paningGestureReceive:)];
    _recognizer.delegate = self;
    [self.view addGestureRecognizer:_recognizer];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - GestureRecognizerDelegate -
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (!self.isOpenGesture) {
        return NO;
    }
    UIView *cell = [gestureRecognizer view];
    CGPoint translation = [gestureRecognizer translationInView:[cell superview]];
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.view];
    // Check for horizontal gesture
    if (fabs(translation.x) > fabs(translation.y) && touchPoint.y > 64)
    {
        return YES;
    }
    
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (self.isMultiGuesture) {
        return YES;
    }
    return NO;
}


#pragma mark - overrid -
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置导航栏按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:0 target:self action:@selector(back)];
    }
    [self.screenShotsList addObject:[self capture]];
    self.recognizer.enabled=YES;
    [super pushViewController:viewController animated:animated];
}
- (void)back{
    [self popViewControllerAnimated:YES];
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self.screenShotsList removeLastObject];
    [lastScreenShotView removeFromSuperview];
    lastScreenShotView = nil;
    self.recognizer.enabled=YES;
    [self performSelector:@selector(logCount) withObject:nil afterDelay:0.5];
    return [super popViewControllerAnimated:animated];
}

- (void)logCount{
    if ([self.viewControllers count] == 1) {
        [self.screenShotsList removeAllObjects];
        if (lastScreenShotView) {
            lastScreenShotView.hidden = YES;
        }
    }
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.screenShotsList removeLastObject];
    [lastScreenShotView removeFromSuperview];
    lastScreenShotView = nil;
    self.recognizer.enabled=YES;
    return [super popToViewController:viewController animated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self.screenShotsList removeAllObjects];
    [lastScreenShotView removeFromSuperview];
    lastScreenShotView = nil;
    self.recognizer.enabled=YES;
    return [super popToRootViewControllerAnimated:animated];
}

#pragma mark- Utility Methods
- (UIImage *)capture
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7) {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
        [self.view.window.rootViewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        
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

- (UIImage *)reDraw
{
    UIGraphicsBeginImageContextWithOptions(self.view.window.rootViewController.view.bounds.size, self.view.opaque, 0.0);
    
    [[[self.viewControllers objectAtIndex:1] view].layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)rePlace
{
    [self.screenShotsList replaceObjectAtIndex:1 withObject:[self reDraw]];
}

- (void)moveViewWithX:(float)x
{
    x = (x > [UIScreen mainScreen].bounds.size.width) ? [UIScreen mainScreen].bounds.size.width : x;
    x = x < 0 ? 0 : x;
    
    CGRect frame = self.view.frame;
    frame.origin.x = x;
    self.view.frame = frame;
    
    float scale = (x/6400)+0.95;
    float alpha = 0.4 - (x/800);
    
    lastScreenShotView.transform = CGAffineTransformMakeScale(scale, scale);
    blackMask.alpha = alpha;
}

#pragma mark- Gesture Recognizer
- (void)paningGestureReceive:(UIPanGestureRecognizer *)recoginzer
{
    if (self.navdelegate && [self.navdelegate respondsToSelector:@selector(JLNavigationPaningGesture:)]) {
        [self.navdelegate JLNavigationPaningGesture:recoginzer];
    }
    if (self.isOpenGesture) {
        if (self.viewControllers.count <= 1 || !self.canDragBack)
        {
            return;
        }
        CGPoint touchPoint = [recoginzer locationInView:[[UIApplication sharedApplication] keyWindow]];
        
        if (recoginzer.state == UIGestureRecognizerStateBegan)
        {
            _isMoving = YES;
            startTouch = touchPoint;
            
            CGRect frame = self.view.frame;
            self.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
            [self.view.superview insertSubview:self.backgroundView belowSubview:self.view];
            blackMask = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)];
            blackMask.backgroundColor = [UIColor blackColor];
            [self.backgroundView addSubview:blackMask];
            self.backgroundView.hidden = NO;
            
            UIImage *lastScreenShot = [self.screenShotsList lastObject];
            lastScreenShotView = [[UIImageView alloc]initWithImage:lastScreenShot];
            [self.backgroundView insertSubview:lastScreenShotView belowSubview:blackMask];
            lastScreenShotView = nil;
        }
        else if (recoginzer.state == UIGestureRecognizerStateEnded)
        {
            if (touchPoint.x - startTouch.x > 50)
            {
                [UIView animateWithDuration:0.3 animations:^{
                    [self moveViewWithX:[UIScreen mainScreen].bounds.size.width];
                } completion:^(BOOL finished) {
                    if (self.navdelegate && [self.navdelegate respondsToSelector:@selector(JLNavigationBack)]) {
                        [self.navdelegate JLNavigationBack];
                    }
                    
                    [self popViewControllerAnimated:NO];
                    CGRect frame = self.view.frame;
                    frame.origin.x = 0;
                    self.view.frame = frame;
                    self.backgroundView.hidden = YES;
                    _isMoving = NO;
                }];
            }
            else
            {
                [UIView animateWithDuration:0.3 animations:^{
                    [self moveViewWithX:0];
                } completion:^(BOOL finished) {
                    _isMoving = NO;
                    self.backgroundView.hidden = YES;
                }];
            }
            return;
        }
        else if (recoginzer.state == UIGestureRecognizerStateCancelled)
        {
            
            [UIView animateWithDuration:0.3 animations:^{
                [self moveViewWithX:0];
            } completion:^(BOOL finished) {
                _isMoving = NO;
                self.backgroundView.hidden = YES;
            }];
            
            return;
        }
        
        if (_isMoving) {
            [self moveViewWithX:touchPoint.x - startTouch.x];
        }
        
    }
}

@end