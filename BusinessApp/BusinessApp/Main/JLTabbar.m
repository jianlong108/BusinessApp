//
// 文 件 名: JLTabbar.m
// 工 程 名: vehicle
// 文件描述:
// 作   者: 王建龙
// 创作日期: 15/6/19.
//  Copyright (c) 2015年 autohome. All rights reserved.


#import "JLTabbar.h"
@interface JLTabbar ()
/**分割线*/
@property (nonatomic, weak)UIView *splite;
@end

@implementation JLTabbar
@dynamic delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
- (void)btnClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(tabBar:DidClickedButton:)]) {
        [self.delegate tabBar:self DidClickedButton:sender];
    }
}
/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置所有tabbarButton的frame
    [self setupAllTabBarButtonsFrame];
}
/**
 *  设置某个按钮的frame
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupAllTabBarButtonsFrame
{
   
    
    // 计算button的尺寸
    CGFloat buttonW = self.frame.size.width/ 4;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 1;
    int tabbarButtonIndex = 0;
        for (UIView *child in self.subviews) {
            Class class = NSClassFromString(@"UITabBarButton");
            if ([child isKindOfClass:class]) {
                child.frame = CGRectMake(tabbarButtonIndex * buttonW, buttonY, buttonW, buttonH);
                // 增加索引
                tabbarButtonIndex++;
                if (tabbarButtonIndex == 2) {
                    
                    tabbarButtonIndex++;
                }
                
            }
        }
}

- (void)addsubBtnWithItem:(UITabBarItem *)item{
//    AHButton *home = [AHButton buttonWithType:UIButtonTypeCustom];
//    [home setImage:item.image forState:UIControlStateNormal];
//    [home setImage:item.selectedImage forState:UIControlStateSelected];
//    [home setTitle:item.title forState:UIControlStateNormal];
//    [home setTitleColor:color(122, 123, 128) forState:UIControlStateNormal];
//    [home setTitleColor:AHTabTextSelectedColor forState:UIControlStateSelected];
//    
//    [home addTarget:self withAction:@selector(btnClick:)];
//    home.tag = item.tag;
//    [self addSubview:home];
//    
//    if (item.tag == 0) {
//        [self btnClick:home];
//    }
}
@end
