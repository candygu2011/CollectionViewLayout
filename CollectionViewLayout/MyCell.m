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

-(void)setType:(int)type
{
    _type = type;
    
    MyCollectionViewLayout *layout = (MyCollectionViewLayout *)self.collectionView.collectionViewLayout;
    layout.type = type;
    
    [self setUpView];
    [_collectionView reloadData];
    
}
- (MyCollectionViewLayout *)myLayoutWithType:(int)type
{
    MyCollectionViewLayout *layout = [[MyCollectionViewLayout alloc] init];
    if (type == 1) {
        layout.type = MyLayoutTypeWithOneItem;
        
    }else if (type == 2){
        layout.type = MyLayoutTypeWithTowItem;

    }else if (type == 3){
        layout.type = MyLayoutTypeWithThreeItem;
        
    }else if (type == 4){
        layout.type = MyLayoutTypeWithFourItem;
        
    }else if (type == 5){
        layout.type = MyLayoutTypeWithFiveItem;
        
    }else if (type == 6){
        layout.type = MyLayoutTypeWithSixItem;
        
    }else if (type == 7){
        layout.type = MyLayoutTypeWithSevenItem;
        
    }else if (type == 8){
        layout.type = MyLayoutTypeWithEightItem;
        
    }else if (type == 9){
        layout.type = MyLayoutTypeWithNightItem;
        
    }
    return layout;
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"collectionView = %ld",(long)indexPath.item);
}


-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        MyCollectionViewLayout *layout = [self myLayoutWithType:self.type];
        layout.minLineSpace = 1;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
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
