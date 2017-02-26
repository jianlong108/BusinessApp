//
//  HomeCycleADmodel.h
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/26.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeCycleADmodel : NSObject

@property(nonatomic,copy)NSString *address;

@property(nonatomic,copy)NSString *beginDateTime;


@property(nonatomic,copy)NSString *endDateTime;

@property(nonatomic,copy)NSString *headPic;

@property(nonatomic,copy)NSString *ADid;

@property(nonatomic,copy)NSString *level;

@property(nonatomic,copy)NSString *number;

@property(nonatomic,copy)NSString *readersNum;

@property(nonatomic,assign)NSUInteger status;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *slogan;

@property(nonatomic,copy)NSString *subject;

/*
address = "\U79d8\U5bc6";
beginDateTime = "2016-07-20";
endDateTime = "2016-07-21";
headPic = "http://img.hodays.com:8088//images/activity/0//20160621/1466491874843_910_516.img";
id = 192;
level = 5;
name = "\U65b0\U7280\U56fd\U9645\U4f20\U5a92";
number = 0;
readersNum = 0;
slogan = "\U5bfb\U627e\U80fd\U7559\U4f4f\U65f6\U5149\U7684\U58f0\U97f3";
status = 2;
subject = "\U6d41\U52a8\U7684\U98e8\U5bb4|\U4e14\U542c\U5929\U7c41";
 */
@end
