//
//  StudentModel.h
//  PPModel
//
//  Created by lh on 2017/7/31.
//  Copyright © 2017年 lh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPKit.h"

@interface StudentInformation : PPKit
@property  (nonatomic, copy)    NSString    *grade;
@property  (nonatomic, assign)  NSString    *Class;
@end

@interface StudentModel : PPKit
@property  (nonatomic, copy)    NSString     *name;
@property  (nonatomic, copy)    NSString     *sex;
@property  (nonatomic, assign)  NSInteger    age;
@property  (nonatomic, strong)  NSDictionary *informations;
@end
