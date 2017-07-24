//
//  NSTimer+BLBlock.h
//  MyFreeMall
//
//  Created by boundlessocean on 16/11/11.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (BLBlock)

/**
 *  初始化timer
 *
 *  @param seconds 执行间隔
 *  @param block   执行方法回调
 *  @param repeats 是否重复
 *
 *  @return timer
 */
+ (NSTimer *)bl_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                         block:(void (^)(NSTimer *timer))block
                                       repeats:(BOOL)repeats;

+ (NSTimer *)bl_timerWithTimeInterval:(NSTimeInterval)seconds
                                block:(void (^)(NSTimer *timer))block
                              repeats:(BOOL)repeats;
@end
