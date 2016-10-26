//
//  ViewController.m
//  CarLog
//
//  Created by MichaelLi on 2016/10/22.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"
#import "CarLogModel.h"
#import "InnerCar.h"
@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) NSArray *dataArray;
@property(nonatomic,strong) NSArray *index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark
#pragma mark -  懒加载
-(NSArray *)dataArray
{
    if (_dataArray ==nil) {
        //读取文件
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil];
        //添加到临时数组中
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];
        //创建可变数组
        NSMutableArray *mutb = [NSMutableArray array];
        //字典转模型
        for (NSDictionary *dict in temp) {
            CarLogModel *carLogModel = [CarLogModel carLogModelWithDict:dict];
            [mutb addObject:carLogModel];
        }
        _dataArray = mutb;
        //把title放到数组中,用作后面的索引
        _index = [mutb valueForKeyPath:@"title"];
    }
    return _dataArray;
}

#pragma mark
#pragma mark -  组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return self.dataArray.count;
}

#pragma mark
#pragma mark -  行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出model
    CarLogModel *carLogModel = self.dataArray[section];
    NSArray *cars = carLogModel.cars;
    return cars.count;
}

#pragma mark
#pragma mark -  行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *indentifier = @"Log";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];

    }
    //取出cars
    CarLogModel *carLogModel = self.dataArray[indexPath.section];
    //再取出InnerCar
    InnerCar *innerCar = carLogModel.cars[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:innerCar.icon];
    cell.textLabel.text = innerCar.name;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarLogModel *carLogModel = self.dataArray[section];
    NSString *str = carLogModel.title;
    //直接返回str
    return str;
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return  self.index;
}
@end

