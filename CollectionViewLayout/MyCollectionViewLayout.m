//
//  MyCollectionViewLayout.m
//  CollectionViewLayout
//
//  Created by aven wu on 4/19/16.
//  Copyright © 2016 gml. All rights reserved.
//

#import "MyCollectionViewLayout.h"
#import "MyCollectionViewCell.h"

#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
@implementation MyCollectionViewLayout

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
   
    NSMutableArray *array = [NSMutableArray array];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];

    if (self.type == MyLayoutTypeWithOneItem) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat w = kScreenWidth;
        CGFloat h = w;
        attrs.frame = CGRectMake(x, y, w, h);
        [array addObject:attrs];
        
    }else if (self.type == MyLayoutTypeWithTowItem){
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 2;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW-_minLineSpace*0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW+_minLineSpace*0.5;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
            
        }
    }else if (self.type == MyLayoutTypeWithThreeItem){
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 3;
            CGFloat preH = kScreenWidth / 3;
            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 2-_minLineSpace*0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 2+_minLineSpace*0.5;
                CGFloat y = 0;
                CGFloat w = preW-_minLineSpace*0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 2;
                CGFloat y = preH+_minLineSpace * 0.5;
                CGFloat w = preW;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
    }else if (self.type == MyLayoutTypeWithFourItem) {
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 2;
            CGFloat preH = kScreenWidth / 2;
            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW-_minLineSpace *0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = 0;
                CGFloat w = preW-_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = 0;
                CGFloat y = preH+ _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = preH + _minLineSpace * 0.5;
                CGFloat w = preW-_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }

    }else if (self.type == MyLayoutTypeWithFiveItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 2;
            CGFloat preH = kScreenWidth / 3;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW-_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = 0;
                CGFloat w = preW - _minLineSpace *0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = 0;
                CGFloat y = preW + _minLineSpace * 0.5;
                CGFloat w = preH -_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = preH + _minLineSpace * 0.5;
                CGFloat y = preW + _minLineSpace * 0.5;
                CGFloat w = preH-_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preH * 2 + _minLineSpace * 0.5;
                CGFloat y = preW +_minLineSpace * 0.5;
                CGFloat w = preH - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
        
    }else if (self.type == MyLayoutTypeWithSixItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 3;
            CGFloat preH = kScreenWidth / 3;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 2 - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = 0;
                CGFloat w = preW -_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = preH + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = 0;
                CGFloat y = preH * 2 - _minLineSpace * 0.5;
                CGFloat w = preW + _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preW -_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
        
    }else if (self.type == MyLayoutTypeWithSevenItem){
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 3;
            CGFloat preH = kScreenWidth / 3 ;
            CGFloat preW2 = kScreenWidth / 4;
            CGFloat preH2 = kScreenWidth / 4;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 2 - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = 0;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = preH + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace *0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = 0;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preH2 - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preH2 + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preH2 - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preH2 * 2 + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preH2 - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 6){
                CGFloat x = preW2 * 3 + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5 ;
                CGFloat w = preW2 - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];

            }
        }

        
    }else if (self.type == MyLayoutTypeWithEightItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 4;
            CGFloat preH = kScreenWidth / 4;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 3 - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 3 + _minLineSpace * 0.5;
                CGFloat y = 0;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 3 + _minLineSpace * 0.5;
                CGFloat y = preH  + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = preW * 3 + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preW-_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = 0;
                CGFloat y = preH * 3 + _minLineSpace *0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = preH * 3 + _minLineSpace *0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 6){
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = preH * 3 + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
                
            }else if (i == 7){
                CGFloat x = preW * 3 + _minLineSpace * 0.5;
                CGFloat y = preH * 3 + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace *0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
    }
    
    else if (self.type == MyLayoutTypeWithNightItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = kScreenWidth / 3;
            CGFloat preH = kScreenWidth / 3;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w ;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = 0;
                CGFloat w = preW - _minLineSpace *0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = 0;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = 0;
                CGFloat y = preH  + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = preH + _minLineSpace * 0.5 ;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = preH + _minLineSpace * 0.5 ;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 6){
                CGFloat x = 0;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preW + _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
                
            }else if (i == 7){
                CGFloat x = preW + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preW - _minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 8){
                CGFloat x = preW * 2 + _minLineSpace * 0.5;
                CGFloat y = preH * 2 + _minLineSpace * 0.5;
                CGFloat w = preW -_minLineSpace * 0.5;
                CGFloat h = w;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }

        }

    }
    
    
    
    
    return array;
}

-(void)prepareLayout
{
    [super prepareLayout];
    [self registerClass:[MyCollectionViewCell class] forDecorationViewOfKind:@"MyCollec"];
    
}

@end
