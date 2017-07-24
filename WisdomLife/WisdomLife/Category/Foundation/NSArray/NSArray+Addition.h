//
//  NSArray+Addition.h
//  boundlessocean
//
//  Created by boundlessocean on 16/5/9.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Addition)

/**
 *  数组去重 
 */
- (instancetype)noRepeatArray;
/**
 *  安全读取数组数据
 *
 *  @param index 索引
 *
 *  @return 数据
 */
- (id)safeObjectAtIndex:(NSUInteger)index;

@end 
