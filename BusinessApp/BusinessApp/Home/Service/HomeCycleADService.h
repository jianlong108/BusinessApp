//
//  HomeCycleADService.h
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/26.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Success)();
typedef void(^Failure)(NSError *error);

@interface HomeCycleADService : NSObject

- (void)getDataSuccess:(Success)success Faile:(Failure)fail;
@property(nonatomic,strong,readonly)NSMutableArray *datas;

@end
