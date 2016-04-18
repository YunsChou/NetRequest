//
//  ViewController.m
//  NetRequest
//
//  Created by weiying on 15/11/25.
//  Copyright © 2015年 Yuns. All rights reserved.
//

#import "ViewController.h"
#import "NetRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlStr = @"www.baidu.com";
    NSDictionary *params = @{@"key" : @"value"};
    
    //get请求
    [NetRequest get:urlStr params:params success:^(id responseObj) {
        
    } failure:^(NSError *error) {
        
    }];
    
    [NetRequest get:urlStr params:params result:^(id responseObj, NSError *error) {
        
    }];
    
    //post请求
    [NetRequest post:urlStr params:params success:^(id responseObj) {
        
    } failure:^(NSError *error) {
        
    }];
    
    [NetRequest post:urlStr params:params result:^(id responseObj, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
