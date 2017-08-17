//
//  WLMessageCenterModel.h
//  WisdomLife
//
//  Created by boundlessocean on 2017/8/4.
//  Copyright © 2017年 boundlessocean. All rights reserved.
//

#import "WLBaseModel.h"

@interface WLMessageCenterModel : WLBaseModel
/**  */
@property (nonatomic ,strong)NSString *iconImageName;
/**  */
@property (nonatomic ,strong)NSString *messageType;
/**  */
@property (nonatomic ,strong)NSString *messageContent;
/**  */
@property (nonatomic ,strong)NSString *date;
/**  */
@property (nonatomic ,strong)NSString *time;
@end
