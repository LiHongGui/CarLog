//
//  InnerCar.m
//  CarLog
//
//  Created by MichaelLi on 2016/10/26.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "InnerCar.h"

@implementation InnerCar



-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self ==[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)innerCarWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
