 //
//  NMNetworkManager.m
//  NMSaleAPP
//
//  Created by xiaoping on 2016/10/20.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMNetworkManager.h"
#import "AFNetworking.h"
#import "NMJSONResponseSerializer.h"
#import "NMHTTPRequestSerializer.h"
#import "NMErrorCode.h"
@interface NMNetworkManager ()
/**
 任务组字典
 */
@property (nonatomic, strong) NSMutableDictionary <NSNumber *, NSURLSessionDataTask *> *taskQueueDict;
@end

@implementation NMNetworkManager

+ (instancetype)defaultManager {
    static NMNetworkManager *httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[NMNetworkManager alloc] init];
    });
    return httpManager;
}

+ (AFHTTPSessionManager *)sharedHttpSessionManager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}

/*******************************  POST  ********************************/
- (NSURLSessionDataTask *)postWithUrlString:(NSString *)urlString timeoutInterval:(NSTimeInterval)timeoutInterval parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse *, id, NSError *))finished {
    
    NMHTTPRequestSerializer *request = [NMHTTPRequestSerializer serializer];
    request.timeoutInterval = timeoutInterval;
    NMJSONResponseSerializer *response = [NMJSONResponseSerializer serializer];
    AFHTTPSessionManager *sessionManager = [[self class] sharedHttpSessionManager];
    sessionManager.requestSerializer = request;
    sessionManager.responseSerializer = response;

    __weak typeof(response) weak_response = response;
    NSURLSessionDataTask *task = [sessionManager POST:urlString parameters:[parameters copy] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.taskQueueDict removeObjectForKey:@(task.taskIdentifier)];
        finished?finished(task.response,responseObject,nil):NULL;
        [self hanldResponseCodeWith:responseObject finished:finished error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.taskQueueDict removeObjectForKey:@(task.taskIdentifier)];
        __strong typeof(weak_response) strong_response = weak_response;
        finished?finished(task.response,strong_response.responseObject,error):NULL;
        [self hanldResponseCodeWith:strong_response.responseObject finished:finished error:error];
    }];
    
    [self.taskQueueDict setObject:task forKey:@(task.taskIdentifier)];
//    NMLog(@"%@",@(task.taskIdentifier));
    
    return task;
}


- (NSURLSessionDataTask *)postWithUrlString:(NSString *)url inParameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse *, id, NSError *))finished {
    NSMutableDictionary *inParameters = [NSMutableDictionary dictionary];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![key isEqualToString:@"accessToken"]) {
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"in[%@]",key]];
        }else{
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"%@",key]];
        }
    }];
    return [self postWithUrlString:url timeoutInterval:40 parameters:[inParameters copy] finished:finished];
}


/*******************************  GET  ********************************/
- (NSURLSessionDataTask *)getWithUrlString:(NSString *)url inParameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse *, id, NSError *))finished {
    NSMutableDictionary *inParameters = [NSMutableDictionary dictionary];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![key isEqualToString:@"accessToken"]) {
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"in[%@]",key]];
        }else{
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"%@",key]];
        }
    }];
    return [self getWithUrlString:url timeoutInterval:40 parameters:[inParameters copy] finished:finished];
}

- (NSURLSessionDataTask *)getWithUrlString:(NSString *)urlString timeoutInterval:(NSTimeInterval)timeoutInterval parameters:(NSDictionary *)parameters finished:(void (^)(NSURLResponse *, id, NSError *))finished {
    
    NMHTTPRequestSerializer *request = [NMHTTPRequestSerializer serializer];
    request.timeoutInterval = timeoutInterval;
    NMJSONResponseSerializer *response = [NMJSONResponseSerializer serializer];
    AFHTTPSessionManager *sessionManager = [[self class] sharedHttpSessionManager];
    sessionManager.requestSerializer = request;
    sessionManager.responseSerializer = response;
    
    __weak typeof(response) weak_response = response;
    NSURLSessionDataTask *task = [sessionManager GET:urlString
                                          parameters:[parameters copy]
                                            progress:nil
                                             success:^(NSURLSessionDataTask * _Nonnull task,
                                 id  _Nullable responseObject) {
                                                 
        [self.taskQueueDict removeObjectForKey:@(task.taskIdentifier)];
        finished?finished(task.response,responseObject,nil):NULL;
        [self hanldResponseCodeWith:responseObject finished:finished error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self.taskQueueDict removeObjectForKey:@(task.taskIdentifier)];
        __strong typeof(weak_response) strong_response = weak_response;
        finished?finished(task.response,strong_response.responseObject,error):NULL;
        [self hanldResponseCodeWith:strong_response.responseObject finished:finished error:error];
    }];
    
    
    [self.taskQueueDict setObject:task forKey:@(task.taskIdentifier)];
    
    return task;
}


/*******************************  uploadImage  ********************************/
+ (NSURLSessionDataTask *)uploadImageForCustCenterWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSString *)fileName progress:(void (^)(NSProgress *uploadProgress))progressHandle completionHandler:(void (^)(NSURLResponse *response,id responseObject,NSError *))finished {
    
    return [[NMNetworkManager defaultManager] uploadImageForCustCenterWithURLString:urlString parameters:parameters data:data fileName:fileName progress:progressHandle completionHandler:finished];
}

- (NSURLSessionDataTask *)uploadImageForCustCenterWithURLString:(NSString *)urlString parameters:(NSDictionary *)parameters data:(NSData *)data fileName:(NSString *)fileName progress:(void (^)(NSProgress *uploadProgress))progressHandle completionHandler:(void (^)(NSURLResponse *response,id responseObject,NSError *))finished {

    NSMutableDictionary *inParameters = [NSMutableDictionary dictionary];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![key isEqualToString:@"accessToken"]) {
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"in[%@]",key]];
        }else{
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"%@",key]];
        }
    }];
    
    NMHTTPRequestSerializer *request = [NMHTTPRequestSerializer serializer];
    request.timeoutInterval = 180;
    
    NMJSONResponseSerializer *response = [NMJSONResponseSerializer new];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    sessionManager.requestSerializer = request;
    sessionManager.responseSerializer = response;
    
    __weak typeof(response) weak_response = response;
    
    return [sessionManager POST:urlString parameters:inParameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"file" fileName:[fileName stringByAppendingString:@".png"] mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            progressHandle?progressHandle(uploadProgress):NULL;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished?finished(task.response,responseObject,nil):NULL;
        [self hanldResponseCodeWith:responseObject finished:finished error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __strong typeof(weak_response) strong_response = weak_response;
        finished?finished(task.response,strong_response.responseObject,error):NULL;
        [self hanldResponseCodeWith:strong_response.responseObject finished:finished error:error];
    }];
}


/*******************************  多文件  ********************************/
- (NSURLSessionDataTask *)uploadImageForCustCenterWithURLString:(NSString *)urlString
                                                     parameters:(NSDictionary *)parameters
                                                      dataArray:(NSArray <NSData *> *)dataArray
                                                      nameArray:(NSArray <NSString *> *)nameArray
                                                       progress:(void (^)(NSProgress *uploadProgress))progressHandle
                                              completionHandler:(void (^)(NSURLResponse *response,
                                                                          id responseObject,
                                                                          NSError *))finished {
    
    NSMutableDictionary *inParameters = [NSMutableDictionary dictionary];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (![key isEqualToString:@"accessToken"]) {
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"in[%@]",key]];
        }else{
            [inParameters setObject:obj forKey:[NSString stringWithFormat:@"%@",key]];
        }
    }];
    
    NMHTTPRequestSerializer *request = [NMHTTPRequestSerializer serializer];
    request.timeoutInterval = 180;
    
    NMJSONResponseSerializer *response = [NMJSONResponseSerializer new];
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    sessionManager.requestSerializer = request;
    sessionManager.responseSerializer = response;
    
    __weak typeof(response) weak_response = response;
    
    return [sessionManager POST:urlString parameters:inParameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (dataArray.count == nameArray.count) {
            for (int i = 0; i < dataArray.count; i++) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";
                NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
                [formData appendPartWithFileData:dataArray[i] name:nameArray[i] fileName:fileName mimeType:@"image/jpeg"];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            progressHandle?progressHandle(uploadProgress):NULL;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished?finished(task.response,responseObject,nil):NULL;
        [self hanldResponseCodeWith:responseObject finished:finished error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __strong typeof(weak_response) strong_response = weak_response;
        finished?finished(task.response,strong_response.responseObject,error):NULL;
        [self hanldResponseCodeWith:strong_response.responseObject finished:finished error:error];
    }];
}


#pragma mark - - 数据处理
- (void)hanldResponseCodeWith:(id _Nullable)responseObject finished:(void (^)(NSURLResponse *, id, NSError *))finished error:(NSError *)error{
    if (finished && responseObject[@"message"] != nil && ![responseObject[@"status"] isEqual:@200]){
        NSString *tip = responseObject[@"message"];
        if ([NSStringFromClass([tip class]) isEqualToString:@"NSNull"]) {
            tip = @"请求失败";
        }
        [NMHUDManager showErrorWithText:tip dismissDelay:kHUDDismissDelay];
    } else if (error != nil && error.code != -999){
        NSString * errorDescription = [NMErrorCode descriptionWithErrorCode:error.code];
        [NMHUDManager showErrorWithText:errorDescription dismissDelay:kHUDDismissDelay];
    }
}

#pragma mark - - 取消网络请求
- (void)cancelTaskRequst{
    [self.taskQueueDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key,
                                                       NSURLSessionDataTask * _Nonnull obj,
                                                       BOOL * _Nonnull stop) {
        if (obj && obj.state == NSURLSessionTaskStateRunning) {
            [obj cancel];
        }
    }];
    [self.taskQueueDict removeAllObjects];
}


#pragma mark - - lazy load

- (NSMutableDictionary<NSNumber *,NSURLSessionDataTask *> *)taskQueueDict{
    
    if (!_taskQueueDict) {
        _taskQueueDict = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return _taskQueueDict;
}
@end

