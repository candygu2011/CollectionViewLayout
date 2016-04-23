//
//  MyCollectionViewCell.m
//  CollectionViewLayout
//
//  Created by GML on 16/4/22.
//  Copyright © 2016年 gml. All rights reserved.
//

#import "MyCollectionViewCell.h"
@interface MyCollectionViewCell()
@end

@implementation MyCollectionViewCell

+(void)initialize
{
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        
    }
    return self;
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:self.frame];
    }
    return _imageView;
}

@end
