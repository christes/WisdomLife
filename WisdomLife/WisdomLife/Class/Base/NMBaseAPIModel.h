//
//  NMBaseAPIModel.h
//  LemonClient
//
//  Created by xiaoping on 2016/11/29.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "WLBaseModel.h"

#define WL_API_PARAME(_NAME) NSStringFromSelector(@selector(_NAME))

extern NSInteger NMAPICodeSuccess;
extern NSInteger NMAPICodeNeedLogin;
extern NSInteger NMAPICodeLostNetwork;

@interface NMBaseAPIModel : WLBaseModel

@property (nonatomic,copy) NSString *response_errorCode;
@property (nonatomic,copy) NSString *response_message;
@property (nonatomic,assign) NSInteger http_code;

@property (nonatomic,copy,readonly) NSDictionary *requestParameters;
@property (nonatomic,copy,readonly) NSString *requestParametersJSON;

//- (NSArray<NSString *> *)apiParametersName;

- (NSString *)api;
- (NSString *)requestBasePath;

@end
