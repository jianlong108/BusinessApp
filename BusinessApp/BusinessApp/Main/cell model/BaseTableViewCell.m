//
//  BaseTableViewCell.m
//  BusinessApp
//
//  Created by Wangjianlong on 2017/2/19.
//  Copyright © 2017年 JL.Com. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initializeSubViews];
}
- (void)prepareForReuse{
    [super prepareForReuse];
    [self clearData];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initializeSubViews];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutContentView];
    
}

- (void)initializeSubViews{
    
}

- (void)setDataModel:(id<CellBaseModelProtocol>)dataModel{
    
}

- (void)layoutContentView{
    
}

- (void)clearData{
}
@end
