//
//  ViewController.m
//  CollectionViewLayout
//
//  Created by aven wu on 4/19/16.
//  Copyright © 2016 gml. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewLayout.h"
#import "MyCell.h"
#import "AttachModel.h"
#import "MyCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"

#import "MBProgressHUD+Add.h"
#import "MBProgressHUD.h"

#import "SDImageCache.h"
#import "MWCommon.h"
#import "MWPhotoBrowser.h"


#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,MyCellSelectedDelegate,MWPhotoBrowserDelegate,UIImagePickerControllerDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_data;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MyCell class] forCellReuseIdentifier:@"MyCell"];
    [self.view addSubview:_tableView];
    
    _data = [NSMutableArray array];
    NSDictionary *dic = [self loadJson];
    NSArray *arr = [AttachModel objectArrayWithKeyValuesArray:dic[@"attach"]];
    for (int i = 0; i < arr.count; i ++) {
        AttachModel *tempModel = arr[i];
        MWPhoto *photo = [MWPhoto photoWithURL:[NSURL URLWithString:tempModel.thumb]];
        photo.caption = tempModel.title;
        photo.title = tempModel.link;
        photo.index = [NSString stringWithFormat:@"%zd / %zd",i+1,arr.count];
        [_data addObject:photo];
    }
    
}

- (NSDictionary *)loadJson
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"home" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    return info;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *emptyCell = [tableView dequeueReusableCellWithIdentifier:@"emptyCellIdentifier"];
    if (indexPath.row % 2 != 1) {
        if(!emptyCell)
        {
            emptyCell = [[UITableViewCell alloc]init];
            emptyCell.selectionStyle = UITableViewCellSelectionStyleNone;
            emptyCell.contentView.backgroundColor = [UIColor lightGrayColor];
            emptyCell.backgroundColor = [UIColor lightGrayColor];
        }
        return emptyCell;
    }else{
        AttachModel *model = _data[indexPath.row/2];
        MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        cell.type = (int)indexPath.row/2;
        NSLog(@"type = %@",model);
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count * 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row %2 != 1) {
        return 10;
    }else{
        return [UIScreen mainScreen].bounds.size.width +100 ;
    }
}
#pragma mark - myCell delagate
-(void)myCell:(UITableViewCell *)cell didSelectedCollectionViewCell:(MyCollectionViewCell *)collectionCell atIndexPath:(NSIndexPath *)indexPath
{
    for (int i = 0; i < _data.count; i++) {
        
    }
    
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displaySelectionButtons = NO;
    browser.alwaysShowControls = NO;
    browser.zoomPhotosToFill = YES;
    browser.enableSwipeToDismiss = YES;

    [browser setCurrentPhotoIndex:indexPath.item];
    
    [self.navigationController pushViewController:browser animated:YES];
    
}

#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return _data.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _data.count)
        return [_data objectAtIndex:index];
    return nil;
}

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index
{
    NSLog(@"Did start viewing photo at index %lu", (unsigned long)index);
}

-(void)photoBrowser:(MWPhotoBrowser *)photoBrowser toolItemLikeBtnClick:(UIBarButtonItem *)like
{
    NSLog(@"点赞");
    
}
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser toolItemCommentBtnClick:(UIBarButtonItem *)comment
{
    NSLog(@"评论");

}

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser toolItemSaveBtnClick:(UIBarButtonItem *)save atIndexPhoto:(NSUInteger)index
{
    MWPhoto *photo = _data[index];
    UIImage *image = photo.underlyingImage;
    NSLog(@"image = %@",image);
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);

    
}
// 保存图片到相册成功回调方法
- (void)image:(UIImage *)image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    if (!error) {
        [MBProgressHUD showMessag:@"正在保存" toView:[UIApplication sharedApplication].keyWindow];
        dispatch_time_t time =  dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow animated:YES];
            NSLog(@"保存成功");
        });
        
    }else
    {
        NSLog(@"保存失败");

    }
    
}
/**
 * 分享某张图片
 **/
- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser actionButtonPressedForPhotoAtIndex:(NSUInteger)index
{
    NSLog(@"分享----%zd",index);

}


//- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
//    if (index < _data.count)
//        return [_data objectAtIndex:index];
//    return nil;
//}


@end
