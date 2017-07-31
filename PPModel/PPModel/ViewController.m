//
//  ViewController.m
//  PPModel
//
//  Created by lh on 2017/7/31.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"
#import "PPKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    StudentModel *student = [StudentModel pp_modelWithJSON:@{@"name":@"李欢",@"age":@18,@"sex":@"男",@"informations":@{@"grade":@"三年级"}} withModelClass:[StudentModel class]];
    NSLog(@"%@",student);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
