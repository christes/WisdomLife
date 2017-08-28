//
//  NSString+Extension.h
//  MyFreeMall
//
//  Created by boundlessocean on 16/9/2.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Category)

- (NSString *) trimTelephoneString;
 /** 去掉前后空格 */
- (NSString *) trimmedString;

/** MD5加密 */
- (NSString *) md5WithString;

/** 有效的电话号码 */
- (BOOL) isValidMobileNumber;

/** 有效的真实姓名 */
- (BOOL) isValidRealName;

/** 有效的银行卡号 */
- (BOOL) isValidBankCardNumber;

/** 有效的邮箱 */
- (BOOL) isValidEmail;

/** 有效的字母数字密码 */
- (BOOL) isValidAlphaNumberPassword;

/** 检测有效身份证 15位 */
- (BOOL) isValidIdentifyFifteen;

/** 18位 */
- (BOOL) isValidIdentifyEighteen;

/** 限制只能输入数字 */
- (BOOL) isOnlyNumber;

/** 是否只有中文 */
- (BOOL) isOnlyChinese;

/** 字符串判空 */
- (BOOL)isNotEmpty;

/** 是否包含表情 */
- (BOOL)isContainsEmoji;

/** object To json */
+ (NSString *)jsonWithObject:(id)object;
@end
