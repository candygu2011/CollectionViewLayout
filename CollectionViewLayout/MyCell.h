//
//  MyCell.h
//  CollectionViewLayout
//
//  Created by GML on 16/4/20.
//  Copyright © 2016年 gml. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCollectionViewCell;
@protocol MyCellSelectedDelegate<NSObject>
- (void)myCell:(UITableViewCell*)cell didSelectedCollectionViewCell:(MyCollectionViewCell *)collectionCell atIndexPath:(NSIndexPath *)indexPath;

@end

@interface MyCell : UITableViewCell

@property (nonatomic,assign) int type;

@property (nonatomic,weak) id<MyCellSelectedDelegate> delegate;

@end
