//
//  NMBaseStore.h
//  NMWalletAPP
//
//  Created by boundlessocean on 2017/3/6.
//  Copyright © 2017年 coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^NMStoreSuccess)(id  _Nullable responseObject);
typedef void(^NMStoreFail)(NSError * _Nullable error);
typedef void(^NMStoreBaseBlock)(id  _Nullable responseObject,NSError * _Nullable error);

@interface NMBaseStore : NSObject
//- (void)requestCodeValueWithParameters:(NSDictionary *_Nullable)parameters block:(NMStoreBaseBlock _Nonnull)block;
@end
