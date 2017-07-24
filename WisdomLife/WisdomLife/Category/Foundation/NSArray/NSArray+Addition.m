//
//  NSArray+Addition.m
//  NeiHan
//
//  Created by Charles on 16/5/9.
//  Copyright © 2016年 Com.Charles. All rights reserved.
//

#import "NSArray+Addition.h"


@implementation NSArray (Addition)

- (instancetype)noRepeatArray { 
    return [self newArrayWithArray:self.mutableCopy];
}

- (NSMutableArray *)newArrayWithArray:(NSMutableArray *)array {
    
    NSMutableArray *newArray = [NSMutableArray new];
    
    for (unsigned i = 0; i < [array count]; i++) {
        if (![newArray containsObject:array[i]]) {
            [newArray addObject:array[i]];
        }
    }
    return newArray;
}


/**
 *  安全读取数组数据
 *
 *  @param index 索引
 *
 *  @return 数据
 */
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if ( index >= self.count )
        return nil;
    
    return [self objectAtIndex:index];
}
@end
 
