//
//  HomeModel.m
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/19.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
#pragma mark - protocol
- (NSString *)cell_Title{
    return _title;
}
- (NSString *)cell_ImageURL{
    return _imageURL;
}
- (UIImage *)cell_ImageObject{
    return _imageObect;
}

//- (Class)cell_ActionTargetClass{
//    
//}
//
//- (CellClickAction)cell_ActionThings{
//    
//}
@end
