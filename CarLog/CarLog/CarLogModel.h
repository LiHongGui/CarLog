//
//  CarLogModel.h
//  CarLog
//
//  Created by MichaelLi on 2016/10/22.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarLogModel : NSObject

@property(nonatomic,strong) NSArray *cars;

@property(nonatomic,copy) NSString *title;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carLogModelWithDict:(NSDictionary *)dict;

@end
