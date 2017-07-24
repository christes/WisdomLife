//
//  WLAPIS.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/7/22.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#ifndef WLAPIS_h
#define WLAPIS_h
//拼接URL
#define WL_API_JOIN_URL(_api) [[[NSUserDefaults standardUserDefaults] objectForKey:kNMAPIDOMAIN] stringByAppendingString:_api]

#endif /* WLAPIS_h */
