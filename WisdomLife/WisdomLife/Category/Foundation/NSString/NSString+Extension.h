//
//  NSString+Additions.h
//  Additions
//
//  Created by Johnil on 13-6-15.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
@interface NSString (Extension)

#pragma mark - java api
- (NSUInteger)compareTo: (NSString*) comp;
- (NSUInteger)compareToIgnoreCase: (NSString*) comp;
- (bool)contains: (NSString*) substring;
- (bool)endsWith: (NSString*) substring;
- (bool)startsWith: (NSString*) substring;
- (NSUInteger)indexOf: (NSString*) substring;
- (NSUInteger)indexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSUInteger)lastIndexOf: (NSString*) substring;
- (NSUInteger)lastIndexOf:(NSString *)substring startingFrom: (NSUInteger) index;
- (NSString*)substringFromIndex:(NSUInteger)from toIndex: (NSUInteger) to;
- (NSString*) trim;
- (NSArray*) split: (NSString*) token;
- (NSString*) replace: (NSString*) target withString: (NSString*) replacement;
- (NSArray*) split: (NSString*) token limit: (NSUInteger) maxResults;

- (CGSize)sizeWithConstrainedToWidth:(float)width fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;
- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font1 lineSpace:(float)lineSpace;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height andWidth:(float)width;
- (void)drawInContext:(CGContextRef)context withPosition:(CGPoint)p andFont:(UIFont *)font andTextColor:(UIColor *)color andHeight:(float)height;
- (NSMutableAttributedString *)drawWithColor:(UIColor *)color range:(NSRange)range;

/**
 根据时间戳 和格式返回时间 字符串

 @param timestamp 时间戳  **** 注意 为0时返回 @"";
 @param format 格式 （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
 @return 时间字符串
 */
+ (NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;
@end
