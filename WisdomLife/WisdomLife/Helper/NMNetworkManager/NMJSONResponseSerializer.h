//
//  NMFailHTTPResponseSerializer.h
//  NMSaleAPP
//
//  Created by xiaoping on 2016/10/20.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NMJSONResponseSerializer : AFJSONResponseSerializer

@property (nonatomic,copy,readonly) NSString *responseMessage;

@property (nonatomic,copy,readonly) NSString *responseErrorCode;

@property (nonatomic,copy,readonly) id responseObject;

@end
