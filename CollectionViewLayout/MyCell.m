//
//  MyCell.m
//  CollectionViewLayout
//
//  Created by GML on 16/4/20.
//  Copyright © 2016年 gml. All rights reserved.
//

#import "MyCell.h"
#import "Masonry.h"
#import "MyCollectionViewLayout.h"

@interface MyCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIImageView *headerImagView;
@property (nonatomic,strong) UILabel *nikeNameLab;
@property (nonatomic,strong) UILabel *timeLab;


@end

@implementation MyCell

- (void)awakeFromNib {

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpView];
    }
    return self;
}

-(void)setUpView
{
    __weak typeof(self) weakSelf = self;

    [self.contentView addSubview:self.headerImagView];
    [self.headerImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.contentView.mas_leading).offset(10);
        make.top.equalTo(weakSelf.contentView.mas_top).offset(10);
        make.size.equalTo(@35);
    }];
    
    [self.contentView addSubview:self.nikeNameLab];
    [self.nikeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.headerImagView.mas_trailing).offset(10);
        make.top.equalTo(weakSelf.headerImagView.mas_top);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.nikeNameLab.mas_leading);
        make.top.equalTo(weakSelf.nikeNameLab.mas_bottom).offset(5);
        make.height.equalTo(@20);
    }];
    
    
    [self.contentView addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView reloadData];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.contentView.mas_leading);
        make.trailing.equalTo(weakSelf.contentView.mas_trailing);
        make.height.equalTo(weakSelf.contentView.mas_width);
        make.top.equalTo(weakSelf.timeLab.mas_bottom).offset(10);
    }];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}



-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        MyCollectionViewLayout *layout = [[MyCollectionViewLayout alloc] init];
        layout.type = MyLayoutTypeWithNightItem;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collectionView = collectionView;
        
    }
    return _collectionView;
}
-(UIImageView *)headerImagView
{
    if (!_headerImagView) {
        UIImageView *header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        _headerImagView = header;
        _headerImagView.backgroundColor = [UIColor orangeColor];
    }
    return _headerImagView;
}

- (UILabel *)nikeNameLab
{
    if (!_nikeNameLab) {
        UILabel *nikeLab = [[UILabel alloc] init];
        nikeLab.text = @"策划似乎 坏死后似乎都是";
        nikeLab.font = [UIFont systemFontOfSize:14];
        nikeLab.textColor = [UIColor redColor];
        nikeLab.backgroundColor = [UIColor yellowColor];
        _nikeNameLab = nikeLab;
    }
    return _nikeNameLab;
}

- (UILabel *)timeLab
{
    if (!_timeLab) {
        UILabel *time = [[UILabel alloc] init];
        time.text = @"10:23:23";
        time.font = [UIFont systemFontOfSize:14];
        time.textColor = [UIColor redColor];
        time.backgroundColor = [UIColor yellowColor];
        _timeLab = time;
    }
    return _timeLab;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
