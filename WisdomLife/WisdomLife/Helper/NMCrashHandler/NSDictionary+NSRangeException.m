//
//  NSDictionary+NSRangeException.m
//  TestDemo
//
//  Created by Bruce on 16/12/22.
//  Copyright © 2016年 Bruce. All rights reserved.
//

#import "NSDictionary+NSRangeException.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSDictionary (NSRangeException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSDictionaryI") swizzleMethod:@selector(objectForKey:) swizzledSelector:@selector(replace_objectForKey:)];
            [objc_getClass("__NSDictionaryI") swizzleMethod:@selector(length) swizzledSelector:@selector(replace_length)];
            [objc_getClass("__NSPlaceholderDictionary") swizzleMethod:@selector(initWithObjects:forKeys:count:) swizzledSelector:@selector(gl_dictionaryWithObjects:forKeys:count:)];
        }
    });
}

- (id)replace_objectForKey:(NSString *)key {
    if ([self isKindOfClass:[NSDictionary class]]) {
        return [self replace_objectForKey:key];
    }
    return nil;
}

- (NSUInteger)replace_length {
    return 0;
}

- (instancetype)gl_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self gl_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

@end
