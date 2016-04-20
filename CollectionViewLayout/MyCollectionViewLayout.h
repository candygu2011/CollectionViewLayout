//
//  MyCollectionViewLayout.h
//  CollectionViewLayout
//
//  Created by aven wu on 4/19/16.
//  Copyright © 2016 gml. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {

typedef NS_ENUM(NSInteger, MyLayoutType) {
    MyLayoutTypeWithOneItem,
    MyLayoutTypeWithTowItem,
    MyLayoutTypeWithThreeItem,
    MyLayoutTypeWithFourItem,
    MyLayoutTypeWithFiveItem,
    MyLayoutTypeWithSixItem,
    MyLayoutTypeWithSevenItem,
    MyLayoutTypeWithEightItem,
    MyLayoutTypeWithNightItem
    
};
@interface MyCollectionViewLayout : UICollectionViewLayout

@property (nonatomic,assign) int minLineSpace;
@property (nonatomic,assign) MyLayoutType type;

@end
