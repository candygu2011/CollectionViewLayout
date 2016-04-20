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
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBAColor(r, g, b ,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
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
        MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
        cell.type = (int)indexPath.row;
        return cell;
    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row %2 != 1) {
        return 10;
    }else{
        return 300;
    }
}


@end
