//
//  PPKit.h
//  PPModel
//
//  Created by lh on 2017/7/31.
//  Copyright © 2017年 lh. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface PPKit : NSObject

+ (NSArray *)propertyKeys;
+ (instancetype)pp_modelWithJSON:(id)json withModelClass:(id)modelClass;
- (BOOL)validate:(NSError **)error;
@end
