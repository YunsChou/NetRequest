//
//  NetRequest.m
//  NetRequest
//
//  Created by weiying on 15/11/25.
//  Copyright © 2015年 Yuns. All rights reserved.
//

#import "NetRequest.h"
#import "AFNetworking.h"

@implementation NetRequest

//GET请求
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //2、声明请求/相应的数据类型
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    //3.发送GET请求
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}


//POST请求
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    //1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //2、声明请求/相应的数据类型
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    //3.发送POST请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/******************二次嵌套返回一个block方法********************/
//GET方法
+ (void)get:(NSString *)url params:(NSDictionary *)params result:(void(^)(id responseObj, NSError *error))result
{
    [self get:url params:params success:^(id responseObj) {
        if (result) {
            result(responseObj, nil);
        }
    } failure:^(NSError *error) {
        if (result) {
            result(nil, error);
        }
    }];
}

//POST方法
+ (void)post:(NSString *)url params:(NSDictionary *)params result:(void(^)(id responseObj, NSError *error))result
{
    [self post:url params:params success:^(id responseObj) {
        if (result) {
            result(responseObj, nil);
        }
    } failure:^(NSError *error) {
        if (result) {
            result(nil, error);
        }
    }];
}

@end
