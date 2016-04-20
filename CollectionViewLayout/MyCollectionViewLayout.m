//
//  MyCollectionViewLayout.m
//  CollectionViewLayout
//
//  Created by aven wu on 4/19/16.
//  Copyright © 2016 gml. All rights reserved.
//

#import "MyCollectionViewLayout.h"

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
        CGFloat w = self.collectionView.bounds.size.width;
        CGFloat h = self.collectionView.bounds.size.height;
        attrs.frame = CGRectMake(x, y, w, h);
        [array addObject:attrs];
        
    }else if (self.type == MyLayoutTypeWithTowItem){
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 2;
            CGFloat preH = self.collectionView.bounds.size.height;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
            
        }
    }else if (self.type == MyLayoutTypeWithThreeItem){
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 3;
            CGFloat preH = self.collectionView.bounds.size.height / 2;
            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 2;
                CGFloat h = preH * 2;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 2;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = self.collectionView.bounds.size.height * 0.5;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 2;
                CGFloat y = preH;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
    }else if (self.type == MyLayoutTypeWithFourItem) {
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 2;
            CGFloat preH = self.collectionView.bounds.size.height / 2;
            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = 0;
                CGFloat y = preH;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = preW;
                CGFloat y = preH;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }

    }else if (self.type == MyLayoutTypeWithFiveItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 2;
            CGFloat preH = self.collectionView.bounds.size.height / 2;
            CGFloat preW2 = self.collectionView.bounds.size.width / 3;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = 0;
                CGFloat y = preH;
                CGFloat w = preW2;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = preW2;
                CGFloat y = preH;
                CGFloat w = preW2;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preW2 * 2;
                CGFloat y = preH;
                CGFloat w = preW2;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
        
    }else if (self.type == MyLayoutTypeWithSixItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 3;
            CGFloat preH = self.collectionView.bounds.size.height / 3;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 2;
                CGFloat h = preH * 2;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 2;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 2;
                CGFloat y = preH;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = 0;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preW;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preW * 2;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
        
    }else if (self.type == MyLayoutTypeWithSevenItem){
        
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 3;
            CGFloat preH = self.collectionView.bounds.size.height / 3;
            CGFloat preW2 = self.collectionView.bounds.size.width / 4;
            
            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 2;
                CGFloat h = preH * 2;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 2;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 2;
                CGFloat y = preH;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = 0;
                CGFloat y = preH * 2;
                CGFloat w = preW2;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preW2;
                CGFloat y = preH * 2;
                CGFloat w = preW2;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preW2 * 2;
                CGFloat y = preH * 2;
                CGFloat w = preW2;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 6){
                CGFloat x = preW2 * 3;
                CGFloat y = preH * 2;
                CGFloat w = preW2;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];

            }
        }

        
    }else if (self.type == MyLayoutTypeWithEightItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 4;
            CGFloat preH = self.collectionView.bounds.size.height / 4;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW * 3;
                CGFloat h = preH * 3;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 3;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 3;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = preW * 3;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = 0;
                CGFloat y = preH * 3;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preW ;
                CGFloat y = preH * 3;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 6){
                CGFloat x = preW * 2;
                CGFloat y = preH * 3;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
                
            }else if (i == 7){
                CGFloat x = preW * 3;
                CGFloat y = preH * 3;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }
        }
    }
    
    else if (self.type == MyLayoutTypeWithNightItem){
        for (int i = 0; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            CGFloat preW = self.collectionView.bounds.size.width / 3;
            CGFloat preH = self.collectionView.bounds.size.height / 3;

            if (i == 0) {
                
                CGFloat x = 0;
                CGFloat y = 0;
                CGFloat w = preW ;
                CGFloat h = preH ;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 1){
                
                CGFloat x = preW * 2;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 2){
                CGFloat x = preW * 3;
                CGFloat y = 0;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 3){
                CGFloat x = 0;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 4){
                CGFloat x = preW;
                CGFloat y = preH ;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 5){
                CGFloat x = preW * 2;
                CGFloat y = preH ;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 6){
                CGFloat x = 0;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
                
            }else if (i == 7){
                CGFloat x = preW;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }else if (i == 8){
                CGFloat x = preW * 2;
                CGFloat y = preH * 2;
                CGFloat w = preW;
                CGFloat h = preH;
                attrs.frame = CGRectMake(x, y, w, h);
                [array addObject:attrs];
            }

        }

    }
    
    
    
    
    return array;
}

@end
