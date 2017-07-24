//
//  NMBaseModel.h
//  NMWalletAPP
//
//  Created by xiaoping on 2016/11/17.
//  Copyright © 2016年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLBaseModel : NSObject
/**
 *  归档 - 存入模型
 */
- (void)archive;

/**
 *  解档 - 取出模型
 */
- (id)unarchiver;

/**
 *  移除缓存中的模型
 */
- (void)remove;

/**
 *  字典数组转模型数组
 */
+ (NSMutableArray *)modelArrayWithDictArray:(NSArray *)response;

/**
 *  字典转模型
 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;
@end
