//
//  MJPhotoToolbar.m
//  FingerNews
//
//  Created by mj on 13-9-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MJPhotoToolbar.h"
#import "MJPhoto.h"
#import "MBProgressHUD+Add.h"

@interface MJPhotoToolbar()
{
    // 显示页码
    UILabel *_indexLabel;
//    UIButton *_saveImageBtn;
}
@end

@implementation MJPhotoToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    if (_photos.count > 1) {
        
        UILabel *photoThemeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width - 100, self.frame.size.height * 0.5)];
        photoThemeLabel.backgroundColor = [UIColor clearColor];
        photoThemeLabel.text = self.photoTheme;
        photoThemeLabel.font = [UIFont boldSystemFontOfSize:16];
        photoThemeLabel.textColor = [UIColor whiteColor];
        [self addSubview:photoThemeLabel];
        
        _indexLabel = [[UILabel alloc] init];
        _indexLabel.font = [UIFont boldSystemFontOfSize:16];
        _indexLabel.frame = CGRectMake((self.frame.size.width - 50) - 30, 0, 70, self.frame.size.height * 0.5);
        _indexLabel.backgroundColor = [UIColor clearColor];
        _indexLabel.textColor = [UIColor whiteColor];
        _indexLabel.textAlignment = NSTextAlignmentCenter;
        _indexLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_indexLabel];
        
        UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(photoThemeLabel.frame.origin.x, self.frame.size.height * 0.5, self.frame.size.width, self.frame.size.height * 0.5)];
        subTitleLabel.font = [UIFont boldSystemFontOfSize:16];
        subTitleLabel.text = self.subTitle;
        subTitleLabel.textColor = [UIColor whiteColor];
        subTitleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:subTitleLabel];
    }
    
//    // 保存图片按钮
//    CGFloat btnWidth = self.bounds.size.height;
//    _saveImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _saveImageBtn.frame = CGRectMake(20, 0, btnWidth, btnWidth);
//    _saveImageBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    [_saveImageBtn setImage:[UIImage imageNamed:@"MJPhotoBrowser.bundle/save_icon.png"] forState:UIControlStateNormal];
//    [_saveImageBtn setImage:[UIImage imageNamed:@"MJPhotoBrowser.bundle/save_icon_highlighted.png"] forState:UIControlStateHighlighted];
//    [_saveImageBtn addTarget:self action:@selector(saveImage) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_saveImageBtn];
}

//- (void)saveImage
//{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        MJPhoto *photo = _photos[_currentPhotoIndex];
//        UIImageWriteToSavedPhotosAlbum(photo.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
//    });
//}

//- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
//{
//    if (error) {
//        [MBProgressHUD showSuccess:@"保存失败" toView:nil];
//    } else {
//        MJPhoto *photo = _photos[_currentPhotoIndex];
//        photo.save = YES;
//        _saveImageBtn.enabled = NO;
//        [MBProgressHUD showSuccess:@"成功保存到相册" toView:nil];
//    }
//}

- (void)setCurrentPhotoIndex:(NSUInteger)currentPhotoIndex
{
    _currentPhotoIndex = currentPhotoIndex;
    
    // 更新页码
    _indexLabel.text = [NSString stringWithFormat:@"%d / %d", _currentPhotoIndex + 1, _photos.count];
    
//    MJPhoto *photo = _photos[_currentPhotoIndex];
//    // 按钮
//    _saveImageBtn.enabled = photo.image != nil && !photo.save;
}

@end