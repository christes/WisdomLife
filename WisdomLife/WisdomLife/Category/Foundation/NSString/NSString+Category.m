//
//  NSString+Extension.m
//  MyFreeMall
//
//  Created by boundlessocean on 16/9/2.
//  Copyright © 2016年 GXCloud. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)


- (BOOL)isNotEmpty
{
    return (self != nil && [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0);
}



- (CGSize)getSizeWithTextSize:(CGSize)size fontSize:(CGFloat)fontSize {
    CGSize resultSize = [self boundingRectWithSize:size
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}
                                           context:nil].size;
    return resultSize;
}

//去掉前后空格
- (NSString *)trimmedString{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

- (NSString *) md5WithString
{
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return [NSString stringWithString:outputString];
}

- (BOOL) isValidMobileNumber {
    NSString* const MOBILE = @"^1(3|4|5|7|8)\\d{9}$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [predicate evaluateWithObject:self];
}

- (BOOL) isValidRealName

{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    
    return [predicate evaluateWithObject:self];
}

- (BOOL) isOnlyChinese
{
    NSString * chineseTest=@"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate*chinesePredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",chineseTest];
    return [chinesePredicate evaluateWithObject:self];
}


- (BOOL) isValidBankCardNumber {
    NSString* const BANKCARD = @"^(\\d{16}|\\d{19})$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", BANKCARD];
    return [predicate evaluateWithObject:self];
}


- (BOOL) isValidEmail
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
}
- (BOOL) validateNickName
{
    NSString *userNameRegex = @"^[A-Za-z0-9\u4e00-\u9fa5]{1,24}+$";
    
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    
    return [userNamePredicate evaluateWithObject:self];
}
- (BOOL) isValidAlphaNumberPassword
{
    NSString *regex = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [identityCardPredicate evaluateWithObject:self];
}


- (BOOL) isValidIdentifyFifteen
{
    NSString * identifyTest=@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}

- (BOOL) isValidIdentifyEighteen
{
    NSString * identifyTest=@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}


- (BOOL) isOnlyNumber
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < self.length) {
        NSString * string = [self substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    
    return res;
}

- (NSString *)trimTelephoneString{
    NSString *telephoneString = self;
    if ([self isValidMobileNumber]) {
        NSString *header = [self substringToIndex:3];
        NSString *footer = [self substringWithRange:NSMakeRange(7, 4)];
        telephoneString = [NSString stringWithFormat:@"%@****%@",header,footer];
    }
    return telephoneString;
}

- (BOOL)isContainsEmoji{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

+ (NSString *)jsonWithObject:(id)object{
    
    NSString *jsonString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:object
                                                                                          options:NSJSONWritingPrettyPrinted
                                                                                            error:nil]
                                                 encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
