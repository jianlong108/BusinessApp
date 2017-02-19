//
//  CellBaseModelProtocol.h
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/19.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CellClickAction)(id);

@protocol CellBaseModelProtocol <NSObject>

@optional
- (NSString *)cell_Title;
- (NSString *)cell_ImageURL;
- (UIImage *)cell_ImageObject;

- (Class)cell_ActionTargetClass;

- (CellClickAction)cell_ActionThings;

@end
