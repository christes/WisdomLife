//
//  NMBaseModel.m
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import "WLBaseModel.h"
#import "NMFileCacheManager.h"
#import "YYModel.h"
@implementation WLBaseModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"responseID": @[@"id", @"ID"]};
}

+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response {
    if ([response isKindOfClass:[NSArray class]]) {
        NSMutableArray *modelArray = [[NSArray yy_modelArrayWithClass:[self class] json:response] copy];
        return modelArray;
    }
    return [NSMutableArray new];
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        return [self yy_modelWithJSON:dictionary];
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
