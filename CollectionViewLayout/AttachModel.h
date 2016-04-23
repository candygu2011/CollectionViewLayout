//
//  AttachModel.h
//  CollectionViewLayout
//
//  Created by GML on 16/4/22.
//  Copyright © 2016年 gml. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttachModel : NSObject
@property (nonatomic,assign)  int attach_id;
@property (nonatomic,copy) NSString *attach_url;
@property (nonatomic,copy) NSString *attach_thumb_url;
@property (nonatomic,copy) NSString *attach_big_url;
@property (nonatomic,assign)  int attach_count;


@end
