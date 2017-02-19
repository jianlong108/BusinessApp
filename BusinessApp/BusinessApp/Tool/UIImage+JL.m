//
//  UIImage+JL.m
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/18.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import "UIImage+JL.h"

@implementation UIImage (JL)
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
