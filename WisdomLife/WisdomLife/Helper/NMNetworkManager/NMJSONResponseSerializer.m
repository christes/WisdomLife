//
//  NMFailHTTPResponseSerializer.m
//  NMSaleAPP
//
//  Created by xiaoping on 2016/10/20.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMJSONResponseSerializer.h"

@implementation NMJSONResponseSerializer

- (BOOL)validateResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    id responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    _responseMessage = responseObject[@"message"];
    _responseErrorCode = responseObject[@"errorCode"];
    _responseObject = responseObject;
    return [super validateResponse:response data:data error:error];
}

@end
