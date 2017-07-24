//
//  NMBaseAPIModel.m
//  LemonClient
//
//  Created by xiaoping on 2016/11/29.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "NMBaseAPIModel.h"
#import <objc/runtime.h>

NSInteger NMAPICodeSuccess = 200;
NSInteger NMAPICodeNeedLogin = 403;
NSInteger NMAPICodeLostNetwork = 0;

@implementation NMBaseAPIModel

//- (NSDictionary *)requestParameters {
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    NSMutableArray *ignoreMapProperties = [NSMutableArray array];
//    
//    [[self zxp_convertToDictionary] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        if ([[self apiParametersName] containsObject:key] && [key hasPrefix:@"request_"]) {
//            [ignoreMapProperties addObject:key];
//            [parameters setObject:obj forKey:[key stringByReplacingOccurrencesOfString:@"request_" withString:@""]];
//        }
//    }];
//    
//    self.zxp_ignoreMapProperties = ignoreMapProperties.copy;
//    
//    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        if ([obj isMemberOfClass:NSClassFromString(@"__NSDictionaryI")]) {
//            NSDictionary *dict = obj;
//            NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
//            NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            [parameters setObject:jsonString forKey:key];
//        }
//    }];
//    
//    return parameters.copy;
//}

- (NSString *)requestParametersJSON {
    NSDictionary *dict = [self requestParameters];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)api {
    return nil;
}

- (NSString *)requestBasePath {
    return nil;
}

- (NSArray<NSString *> *)apiParametersName {
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray<NSString *> *arr = [NSMutableArray array];
    for (int i = 0; i<count; i++) {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        [arr addObject:name];
    }
    
    free(properties);
    return arr.copy;
}

@end
