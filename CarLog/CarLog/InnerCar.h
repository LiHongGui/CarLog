//
//  InnerCar.h
//  CarLog
//
//  Created by MichaelLi on 2016/10/26.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 因为icon name是在cars内部
@interface InnerCar : NSObject
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)innerCarWithDict:(NSDictionary *)dict;
@end
