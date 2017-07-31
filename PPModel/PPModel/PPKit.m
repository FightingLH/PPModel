//
//  PPKit.m
//  PPModel
//
//  Created by lh on 2017/7/31.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "PPKit.h"
#import <objc/runtime.h>
@implementation PPKit

- (NSString *)description
{
    Class   obj = [self class];
    NSArray *proList = [obj _pp_modelProperty:self];
    return [self dictionaryWithValuesForKeys:proList].description;
}

+ (NSDictionary *)_pp_dictionaryWithJSON:(id)json
{
    if (!json || json == (id)kCFNull) return nil;
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    }else if([json isKindOfClass:[NSString class]])
    {
        jsonData = [(NSString *)json dataUsingEncoding:NSUTF8StringEncoding];
    }else if([json isKindOfClass:[NSData class]])
    {
        jsonData = json;
    }
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        if (![dic isKindOfClass:[NSDictionary class]])  dic = nil;
    }
    return dic;
}

+ (instancetype)pp_modelWithJSON:(id)json withModelClass:(id)modelClass
{
    NSDictionary *dic = [self _pp_dictionaryWithJSON:json];
    id objList = [[modelClass alloc] init];
    NSArray *proList = [self _pp_modelProperty:modelClass];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([proList containsObject:key]) {
            [objList setValue:obj forKey:key];
        }
    }];
    return objList;
}

+ (NSArray *)_pp_modelProperty:(id)modelClass
{
    unsigned int count = 0;
    objc_property_t *property =  class_copyPropertyList([modelClass class], &count);
    NSMutableArray *propertyArray = @[].mutableCopy;
    for (unsigned  int i = 0; i < count; i ++) {
        objc_property_t pty = property[i];
        const char *cName = property_getName(pty);
        NSString *objcStr = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [propertyArray addObject:objcStr];
    }
    free(property);
    return propertyArray.copy;
}

@end
