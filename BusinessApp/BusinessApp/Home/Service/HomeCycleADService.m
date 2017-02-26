//
//  HomeCycleADService.m
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/26.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import "HomeCycleADService.h"
#import "HomeCycleADmodel.h"
typedef void(^SuccessBlock)(NSURLSessionDataTask *task,id responData);
typedef void(^FailureBlock)(NSURLSessionDataTask *task,NSError *error);

@interface HomeCycleADService ()
@property(nonatomic,strong)AFHTTPSessionManager *manager;
@property(nonatomic,strong,readwrite)NSMutableArray *datas;
@end

@implementation HomeCycleADService
- (instancetype)init{
    if (self = [super init]) {
        _datas = [NSMutableArray array];
    }
    return self;
}
- (void)getDataSuccess:(Success)success Faile:(Failure)fail{
    __weak typeof(self)weakSelf = self;
    [self getDataWithURLStr:@"http://www.hodays.com:8119/lv/api/lv/index/indexShare" Success:^(NSURLSessionDataTask *task, id responData)
    {
        NSError *error;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:responData
                                        options:NSJSONReadingMutableContainers
                                          error:&error];
        NSDictionary *body = [jsonData objectForKey:@"body"];
        NSArray *share = [body objectForKey:@"share"];
        for (NSDictionary *dic in share) {
//            NSLog(@"%@",dic);
            HomeCycleADmodel *model = [[HomeCycleADmodel alloc]init];
            model.address = dic[@"address"];
            model.beginDateTime = dic[@"beginDateTime"];
            model.endDateTime = dic[@"endDateTime"];
            model.headPic = dic[@"headPic"];
            model.ADid = dic[@"id"];
            model.level = dic[@"level"];
            model.number = dic[@"number"];
            model.readersNum = dic[@"readersNum"];
            model.status = [dic[@"status"]unsignedIntegerValue];
            model.name = dic[@"name"];
            model.slogan = dic[@"slogan"];
            model.subject = dic[@"subject"];
            [weakSelf.datas addObject:model];
        }
        if (success) {
            success();
        }
    } Faile:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        if (fail) {
            fail(error);
        }
    }];
}
- (void)getDataWithURLStr:(NSString *)urlStr Success:(SuccessBlock)success Faile:(FailureBlock)fail{
    _manager = [AFHTTPSessionManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager GET:urlStr parameters:nil success:success failure:fail];
}
@end
