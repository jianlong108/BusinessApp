//
//  HomeViewController.m
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/16.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import "HomeCycleADService.h"
#import "HomeCycleADmodel.h"
#import "DCPicScrollView.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *mainView;

@property(nonatomic,strong)NSMutableArray *dataArray;


/**
 顶部轮播图service
 */
@property(nonatomic,strong)HomeCycleADService *ADService;

@end

@implementation HomeViewController
#pragma mark - view circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    [self configureView];
    
    [self configureData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private
- (void)configureData
{
    __weak typeof(self)weakSelf = self;
    _ADService = [[HomeCycleADService alloc]init];
    [_ADService getDataSuccess:^{
        NSMutableArray *array = [NSMutableArray array];
        for (HomeCycleADmodel *model in self.ADService.datas) {
            [array addObject: model.headPic];
        }
        //轮播图
        DCPicScrollView *headerView = [[DCPicScrollView alloc]initWithFrame:CGRectMake(0, 0, _mainView.bounds.size.width, 200) WithImageNames:array];
        weakSelf.mainView.tableHeaderView = headerView;
        
        //流动的飨食
        HomeModel *model1 = [[HomeModel alloc]init];
        model1.cellHeight = 64;
        model1.title = @"流动的飨食";
        [weakSelf.dataArray addObject:model1];
        int i =0;
        for (HomeCycleADmodel *adModel in self.ADService.datas) {
            HomeModel *model = [[HomeModel alloc]init];
            model.imageURL = adModel.headPic;
            model.cellHeight = 200;
            [weakSelf.dataArray addObject:model];
            i++;
            if (i>2) {
                break;
            }
        }
        
        [weakSelf.mainView reloadData];
    } Faile:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
//    HomeModel *model2 = [[HomeModel alloc]init];
//    model2.title = @"品牌故事";
//    model2.cellHeight = 64;
//    [self.dataArray addObject:model2];
//    
//    for (int i = 0;i<3;i++) {
//        HomeModel *model = [[HomeModel alloc]init];
//        NSString *name = [NSString stringWithFormat:@"h%d",i+1];
//        model.imageObect = [UIImage imageNamed:name];
//        model.cellHeight = 200;
//        [self.dataArray addObject:model];
//    }
//    
//    HomeModel *model3 = [[HomeModel alloc]init];
//    model3.title = @"TV show";
//    model3.cellHeight = 64;
//    [self.dataArray addObject:model3];
//    
//    for (int i = 0;i<3;i++) {
//        HomeModel *model = [[HomeModel alloc]init];
//        NSString *name = [NSString stringWithFormat:@"h%d",i+1];
//        model.imageObect = [UIImage imageNamed:name];
//        model.cellHeight = 200;
//        [self.dataArray addObject:model];
//    }
}
- (void)configureView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    _mainView = tableView;
    
    
}
#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home_cell"];
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"home_cell"];
    }
    
    cell.dataModel = _dataArray[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeModel *model = _dataArray[indexPath.row];
    return model.cellHeight;
}
#pragma mark - lazy
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
#pragma mark - statusbar
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
