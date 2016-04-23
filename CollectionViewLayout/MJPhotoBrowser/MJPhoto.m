//
//  MJPhoto.m
//
//  Created by mj on 13-3-4.
//  Copyright (c) 2013年 itcast. All rights reserved.

#import <QuartzCore/QuartzCore.h>
#import "MJPhoto.h"
#import "UIImage+Additional.h"

static MJPhoto *_lastPhoto = nil;
@interface MJPhoto ()
@property (nonatomic, strong) UIImage *capture;
@end

@implementation MJPhoto

#pragma mark 截图
- (UIImage *)capture:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)setSrcImageView:(UIImageView *)srcImageView
{
    _srcImageView = srcImageView;
    _placeholder = srcImageView.image;
    if (srcImageView.clipsToBounds) {
        _capture = [self capture:srcImageView];
    }
}

- (void)setOptimizeSrcImageView:(UIImageView *)srcImageView{
    if(_lastPhoto == nil){
        _lastPhoto = [[MJPhoto alloc] init];
    }
    _srcImageView = srcImageView;
    _placeholder = srcImageView.image;
    if(_lastPhoto.srcImageView == srcImageView){
        _capture = _lastPhoto.capture;
    }
    else{
        if (srcImageView.clipsToBounds) {
            _capture = [self capture:srcImageView];
        }
        _lastPhoto.srcImageView = srcImageView;
        _lastPhoto.capture = _capture;
    }
}

@end
