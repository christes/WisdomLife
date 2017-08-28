//
//  NMHTTPRequestSerializer.m
//  LemonClient
//
//  Created by xiaoping on 2016/11/30.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMHTTPRequestSerializer.h"

@implementation NMHTTPRequestSerializer

+ (instancetype)serializer {
    id request = [super serializer];
//    NSMutableString *clientUserAgent = [NSMutableString string];
//    [clientUserAgent appendString:[UIDevice currentDevice].systemName];
//    [clientUserAgent appendFormat:@"+name:%@",[UIDevice currentDevice].name];
//    [clientUserAgent appendFormat:@"+model:%@",[UIDevice currentDevice].model];
//    [clientUserAgent appendFormat:@"+%@",[UIDevice currentDevice].systemVersion];
//    
//    NSDictionary<NSString *, id> *info = [NSBundle mainBundle].infoDictionary;
//    NSString *currentVersion = info[@"CFBundleShortVersionString"];
//    [clientUserAgent appendFormat:@"+APPVersion:%@",currentVersion];
//    
//    [request setValue:[NMAPPContext defaultContext].accessToken forHTTPHeaderField:@"accessToken"];
//    [request setValue:[NMAPPContext getCurrentContext].uuid forHTTPHeaderField:@"phoneKey"];
//    [request setValue:clientUserAgent.description forHTTPHeaderField:@"clientUserAgent"];
//    [request setValue:[NMAPPContext getCurrentContext].clientKey forHTTPHeaderField:@"clientKey"];
//    [request setValue:[UIDevice currentDevice].model forHTTPHeaderField:@"model"];
    
    return request;
}

@end
