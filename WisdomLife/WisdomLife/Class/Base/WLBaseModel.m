//
//  NMBaseModel.m
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "WLBaseModel.h"
#import "MJExtension.h"
#import "NMFileCacheManager.h"
@implementation WLBaseModel
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID" : @"id",
             @"isNewVersion" : @"newVersion"};
}

+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response {
    if ([response isKindOfClass:[NSArray class]]) {
        NSMutableArray *array = [self mj_objectArrayWithKeyValuesArray:response];
        return array;
    }
    return [NSMutableArray new];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:dictionary];
    }
    return [[self alloc] init];
}

- (id)unarchiver {
    id obj = [NMFileCacheManager getObjectByFileName:[self.class description]];
    return obj;
}

- (void)archive {
    [NMFileCacheManager saveObject:self byFileName:[self.class description]];
}

- (void)remove {
    [NMFileCacheManager removeObjectByFileName:[self.class description]];
}

@end
