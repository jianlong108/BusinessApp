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

#import "DCPicScrollView.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)UITableView *mainView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation HomeViewController
#pragma mark - view circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureData];
    
    [self configureView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - private
- (void)configureData
{
    _dataArray = [NSMutableArray array];
    HomeModel *model1 = [[HomeModel alloc]init];
    model1.cellHeight = 64;
    model1.title = @"流动的飨食";
    [_dataArray addObject:model1];
    
    for (int i = 0;i<3;i++) {
        HomeModel *model = [[HomeModel alloc]init];
        NSString *name = [NSString stringWithFormat:@"h%d",i+1];
        model.imageObect = [UIImage imageNamed:name];
        model.cellHeight = 200;
        [_dataArray addObject:model];
    }
    
    HomeModel *model2 = [[HomeModel alloc]init];
    model2.title = @"品牌故事";
    model2.cellHeight = 64;
    [_dataArray addObject:model2];
    
    for (int i = 0;i<3;i++) {
        HomeModel *model = [[HomeModel alloc]init];
        NSString *name = [NSString stringWithFormat:@"h%d",i+1];
        model.imageObect = [UIImage imageNamed:name];
        model.cellHeight = 200;
        [_dataArray addObject:model];
    }
    
    HomeModel *model3 = [[HomeModel alloc]init];
    model3.title = @"TV show";
    model3.cellHeight = 64;
    [_dataArray addObject:model3];
    
    for (int i = 0;i<3;i++) {
        HomeModel *model = [[HomeModel alloc]init];
        NSString *name = [NSString stringWithFormat:@"h%d",i+1];
        model.imageObect = [UIImage imageNamed:name];
        model.cellHeight = 200;
        [_dataArray addObject:model];
    }
    
}
- (void)configureView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    _mainView = tableView;
    
    DCPicScrollView *headerView = [[DCPicScrollView alloc]initWithFrame:CGRectMake(0, 0, _mainView.bounds.size.width, 260) WithImageNames:@[@"h1",@"h2",@"h3",@"h4"]];
    _mainView.tableHeaderView = headerView;
}
#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
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

#pragma mark - statusbar
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
