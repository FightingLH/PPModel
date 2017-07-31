//
//  PPKit.h
//  PPModel
//
//  Created by lh on 2017/7/31.
//  Copyright © 2017年 lh. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface PPKit : NSObject
+ (instancetype)pp_modelWithJSON:(id)json withModelClass:(id)modelClass;
@end
