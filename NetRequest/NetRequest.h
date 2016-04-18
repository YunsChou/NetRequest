//
//  NetRequest.h
//  NetRequest
//
//  Created by weiying on 15/11/25.
//  Copyright © 2015年 Yuns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequest : NSObject

//==============【封装第三方的网络请求】===========
//@param url     请求路径
//@param params  请求参数
//@param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
//@param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）

//GET方法
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

//POST方法
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

/******************二次嵌套返回一个block方法********************/
//GET方法
+ (void)get:(NSString *)url params:(NSDictionary *)params result:(void(^)(id responseObj, NSError *error))result;

//POST方法
+ (void)post:(NSString *)url params:(NSDictionary *)params result:(void(^)(id responseObj, NSError *error))result;

@end
