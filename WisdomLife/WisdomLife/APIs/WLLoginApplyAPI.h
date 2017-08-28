//
//  WLLoginApplyAPI.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/27.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#ifndef WLLoginApplyAPI_h
#define WLLoginApplyAPI_h

// 获取验证码
#define WL_API_APPLY_GETCODE   WL_API_JOIN_URL(@"api/app/login/createcode")
// 校验验证码
#define WL_API_APPLY_CHECKCODE   WL_API_JOIN_URL(@"api/app/login/checkCode")
// 注册
#define WL_API_APPLY_ADDUSER   WL_API_JOIN_URL(@"api/app/login/addUser")
// 修改密码
#define WL_API_APPLY_CHANGEPWD   WL_API_JOIN_URL(@"api/app/login/alterPwd")



#endif /* WLLoginApplyAPI_h */
