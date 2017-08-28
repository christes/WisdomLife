//
//  NMNetworkManager.h
//  NMSaleAPP
//
//  Created by xiaoping on 2016/10/20.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NMBaseAPIModel;
@interface NMNetworkManager : NSObject

/** 
 取消网络请求
 */
- (void)cancelTaskRequst;

+ (instancetype)defaultManager;

/**
 POST
 */
- (NSURLSessionDataTask *)postWithUrlString:(NSString *)url timeoutInterval:(NSTimeInterval)timeoutInterval parameters:(NSDictionary *)parameters finished:(void(^)(NSURLResponse *response,id responseObject,NSError *error))finished;
- (NSURLSessionDataTask *)postWithUrlString:(NSString *)url inParameters:(NSDictionary *)parameters finished:(void(^)(NSURLResponse *response,id responseObject,NSError *error))finished;

/** 
 GET
 */
- (NSURLSessionDataTask *)getWithUrlString:(NSString *)url inParameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse *response,id responseObject,NSError *error))finished;
- (NSURLSessionDataTask *)uploadImageForCustCenterWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSString *)fileName progress:(void (^)(NSProgress *uploadProgress))progressHandle completionHandler:(void (^)(NSURLResponse *response,id responseObject,NSError *error))finished;

/** 
 UPLOAD IMAGE
 */
+ (NSURLSessionDataTask *)uploadImageForCustCenterWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSString *)fileName progress:(void (^)(NSProgress *uploadProgress))progressHandle completionHandler:(void (^)(NSURLResponse *response,id responseObject,NSError *error))finished;

/**
 多文件上传
 */
- (NSURLSessionDataTask *)uploadImageForCustCenterWithURLString:(NSString *)urlString
                                                     parameters:(NSDictionary *)parameters
                                                      dataArray:(NSArray <NSData *> *)dataArray
                                                      nameArray:(NSArray <NSString *> *)nameArray
                                                       progress:(void (^)(NSProgress *uploadProgress))progressHandle
                                              completionHandler:(void (^)(NSURLResponse *response,
                                                                          id responseObject,
                                                                          NSError *))finished;

@end
