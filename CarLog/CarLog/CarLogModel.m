//
//  CarLogModel.m
//  CarLog
//
//  Created by MichaelLi on 2016/10/22.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "CarLogModel.h"
#import "InnerCar.h"
@implementation CarLogModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];

        //因为里面还包含了内容,所以要在这里再次字典转换模型
        //穿件可变数组
        NSMutableArray *mutb = [NSMutableArray array];
        for (NSDictionary *dict in self.cars) {

            InnerCar *innerCar = [InnerCar innerCarWithDict:dict];
            [mutb addObject:innerCar];
        }
        self.cars = mutb;
    }
    return self;
}

+(instancetype)carLogModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
