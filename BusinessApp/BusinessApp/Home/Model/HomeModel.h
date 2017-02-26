//
//  HomeModel.h
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/19.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellBaseModelProtocol.h"

@interface HomeModel : NSObject<CellBaseModelProtocol>
@property(nonatomic,strong)UIImage *imageObect;
@property(nonatomic,copy)NSString *imageURL;
@property(nonatomic,copy)NSString *title;

@property(nonatomic,assign)CGFloat cellHeight;

@end
