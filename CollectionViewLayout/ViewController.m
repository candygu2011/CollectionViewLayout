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
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "MyCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,MyCellSelectedDelegate>
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
    
    _data = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        AttachModel *model = [[AttachModel alloc] init];
        /*
         @"http://www.shifenkafei.com/data/upload/553deb1621af2.jpg",@"http://www.meiwai.net/uploads/allimg/c150907/14416140N1GZ-51951.jpg",@"http://pic60.nipic.com/file/20150211/18733170_145247158001_2.jpg",@"http://www.qnong.com.cn/uploadfile/2014/1208/20141208041511349.jpg",
         */
        model.attach_big_url = @"http://www.goumin.com/attachments/upload/1310/17/1381987555-692.jpg";
        [_data addObject:model];
    }
    

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
        AttachModel *model = _data[indexPath.row];
        MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        cell.type = (int)indexPath.row/2;
//        [cell.imageView setImageWithURL:[NSURL URLWithString:model.attach_big_url] placeholderImage:nil];
        NSLog(@"type = %d",cell.type);
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
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
    
    //1.创建图片浏览器
    MJPhotoBrowser *brower = [[MJPhotoBrowser alloc] init];
    //2.告诉图片浏览器显示所有的图片
    NSMutableArray *photos = [NSMutableArray array];
    for (int i = 0 ; i < _data.count; i++) {
        AttachModel *model = _data[i];
        //传递数据给浏览器
        MJPhoto *photo = [[MJPhoto alloc] init];
        photo.url = [NSURL URLWithString:model.attach_big_url];

        UIImageView *img = (UIImageView *)collectionCell.imageView;
        photo.srcImageView = img; //设置来源哪一个UIImageView
        [photos addObject:photo];
    }
    brower.photos = photos;
    //3.设置默认显示的图片索引
    brower.currentPhotoIndex = indexPath.item;
    
    //4.显示浏览器
    [brower show];
}


@end
