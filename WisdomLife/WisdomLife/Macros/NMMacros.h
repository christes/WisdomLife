//
//  NMMacros.h
//  NMWalletAPP
//
//  Created by boundlessocean on 2016/11/18.
//  Copyright © 2016年 coffee. All rights reserved.
//

#ifndef NMMacros_h
#define NMMacros_h



//----------------------ABOUT SCREEN & SIZE  ----------------------------

#define WL_SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define WL_SCREEN_H ([UIScreen mainScreen].bounds.size.height)
#define WL_HEIGHT(h)       h*WL_SCREEN_H/667
#define WL_WIDTH(w)        w*WL_SCREEN_W/375

/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6/6s 分辨率375x667，像素750x1334，@2x */
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6/6s Plus 分辨率414x736，像素1242x2208，@3x */
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


//----------------------ABOUT PRINTING LOG 打印日志 ----------------------------
//Using MFLog to print while in debug model.        调试状态下打印日志

// ...表示宏定义的可变参数
// __VA_ARGS__:表示函数里的可变参数
#ifdef DEBUG
#define WLLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define WLLog(...)
#endif

// weak and strong

#define WL_WEAKSELF @WL_Self_Weak
#define WL_STRONGSELF @WL_Self_Strong
#define WL_STRONGLY_SELF __strong typeof(_WL_self_weak) strongSelf = _WL_self_weak;

#define WL_Self_Weak autoreleasepool {} __weak typeof(self) _WL_self_weak = self;
#define WL_Self_Strong autoreleasepool {} __strong typeof(_WL_self_weak) self = _WL_self_weak;

//----------------------ABOUT COLOR 颜色相关 ----------------------------

/** RGB */
#define WL_RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
/** RGBA */
#define WL_RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/** RGB 颜色转换（16进制->10进制）*/
#define WL_HEXCOLOR(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
/** RGB 颜色转换带透明度（16进制->10进制）*/
#define WL_HEXACOLOR(hexValue, alphaValue) \
[UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(hexValue & 0x0000FF))/255.0 \
alpha:alphaValue]

/** 主题颜色 */
#define WL_COLOR_THEME          WL_RGBCOLOR(50,178,255)

/** 底板背景色 */
#define WL_COLOR_BACKG          WL_HEXCOLOR(0xf6f9fe)
/** 分割线颜色 */
#define WL_COLOR_LINE           WL_HEXCOLOR(0xdfdfdf)
/** 主要字体 */
#define WL_COLOR_TITLE          WL_HEXCOLOR(0x333333)
/** 次要字体 */
#define WL_COLOR_SUBTITLE       WL_HEXCOLOR(0x666666)
/** 提示性字体 */
#define WL_COLOR_PLACEHOLDER    WL_HEXCOLOR(0x999999)
/** 网络连接字体 */
#define WL_COLOR_NET            WL_HEXCOLOR(0x4eb5e5)
//----------------------SYSTEM FONT 系统字体 ----------------------------

#define WL_FONT(a)          [UIFont systemFontOfSize:(a*WL_SCREEN_W/375)]
#define WL_THIN_FONT(a)     [UIFont fontWithName:@"STHeitiTC-Light" size:(a*WL_SCREEN_W/375)]
#define WL_BOLD_FONT(a)     [UIFont boldSystemFontOfSize:(a*WL_SCREEN_W/375)]

//----------------------SOMETHING ELSE 其他 ----------------------------

#define WL_KEYWINDOW       [UIApplication sharedApplication].keyWindow

#define WL_DOC_PATH        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/** GCD */
#define WL_GCD_GLOBAL(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define WL_GCD_MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define WL_GCD_AFTER(time,block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(),block)
/** 判断 真机／模拟器 */
#if TARGET_OS_IPHONE
#define OSIPHONE
#elif TARGET_IPHONE_SIMULATOR
#endif
//单例化 一个类

#define WL_SINGLETION(__clazz) \
+ (__clazz *)sharedInstance;

#define WL_DEF_SINGLETION(__clazz) \
+ (__clazz *)sharedInstance \
{\
static dispatch_once_t once; \
static __clazz * __singletion;\
dispatch_once(&once,^{__singletion = [[__clazz alloc] init];});\
return __singletion;\
}

#endif /* NMMacros_h */
