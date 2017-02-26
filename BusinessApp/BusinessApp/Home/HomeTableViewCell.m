//
//  HomeTableViewCell.m
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/19.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface HomeTableViewCell()
@property(nonatomic,weak)UIImageView *acceroyView;
@property(nonatomic,weak)UILabel *titleLabel;

@property(nonatomic,weak)UIImageView *imageView_Main;
@end

@implementation HomeTableViewCell

- (void)initializeSubViews{
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    _titleLabel.hidden = YES;
    
    UIImageView *acceroyView = [[UIImageView alloc]init];
    [self.contentView addSubview:acceroyView];
    _acceroyView = acceroyView;
    _acceroyView.hidden = YES;
    
    
    UIImageView *imageView_Main = [[UIImageView alloc]init];
    [self.contentView addSubview:imageView_Main];
    _imageView_Main = imageView_Main;
    _imageView_Main.hidden = YES;
    
}

- (void)setDataModel:(id<CellBaseModelProtocol>)dataModel{
    if ([dataModel cell_Title]) {
        _titleLabel.hidden = NO;
        _acceroyView.hidden = NO;
        
        _titleLabel.text = [dataModel cell_Title];
    }else if ([dataModel cell_ImageURL]){
        _imageView_Main.hidden = NO;
        [_imageView_Main setImageWithURL:[NSURL URLWithString:[dataModel cell_ImageURL]]  placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    }else if([dataModel cell_ImageObject]){
        _imageView_Main.hidden = NO;
        _imageView_Main.image = [dataModel cell_ImageObject];
    }
}

- (void)layoutContentView{
    CGFloat w = self.contentView.bounds.size.width;
    CGFloat h = self.contentView.bounds.size.height;
    
    _titleLabel.frame = CGRectMake(0, 0, w, h);
    _acceroyView.frame = CGRectMake(w-44-20, 0, 44, 44);
    _imageView_Main.frame = CGRectMake(0, 5, w, h-10);
}

- (void)clearData{
    _acceroyView.hidden = YES;
    _titleLabel.hidden = YES;
    _imageView_Main.hidden = YES;
}
@end
