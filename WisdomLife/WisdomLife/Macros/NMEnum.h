//
//  NMEnum.h
//  NMWalletAPP
//
//  Created by boundlessocean on 2016/11/18.
//  Copyright © 2016年 coffee. All rights reserved.
//
#ifndef NMEnum_h
#define NMEnum_h

// 钱包首页-认证状态
typedef NS_ENUM (NSInteger, NMWalletHomePushVCStatueType){
    
    NMWalletHomePushVCStatueTypeLogin,                  // 登录状态
    NMWalletHomePushVCStatueTypeAuthentication,         // 认证状态
    NMWalletHomePushVCStatueTypeTranPWD                 // 交易密码设置状态
};

// 钱包首页 - notification(通知中心类型)
typedef NS_ENUM (NSInteger, NMHomeNotificationType){
    
    NMHomeNotificationTypeLogin,                        // 登录通知
    NMHomeNotificationTypeHomeRefresh,                  // 首页需要刷新
    NMHomeNotificationTypeInactive,                     // 推送处于后台状态
    NMHomeNotificationTypeActive,                       // 推送处于前台
};

// 认证中心 - notification(通知中心类型)
typedef NS_ENUM (NSInteger, NMACNotificationType){
    
    NMACNotificationTypeItemRefresh,                    // 登录通知
    NMACNotificationTypeServersNotification,            // 服务端推送
};

// 首页-侧滑栏状态
typedef NS_ENUM (NSInteger, NMWalletSliderViewStateType){
    
    NMWalletSliderViewStateTypeClose,                   // 待登录状态
    NMWalletSliderViewStateTypeOpen                     // 待认证状态
};

// 钱包首页-认证状态
typedef NS_ENUM (NSInteger, NMWalletHomeViewButtonType){
    
    NMWalletHomeViewButtonTypeAuthenticationState,      // 认证状态
    NMWalletHomeViewButtonTypePromoteLimit,             // 提额
    NMWalletHomeViewButtonTypeApplyCash,                // 提取现金
    NMWalletHomeViewButtonTypeRepayment,                // 还款
    NMWalletHomeViewButtonTypeAttestation,              // 认证中心
    NMWalletHomeViewButtonTypeBill,                     // 我的账单
    NMWalletHomeViewButtonTypeTell,                     // 联系我们
    NMWalletHomeViewButtonTypeGuide,                    // 新手引导
    NMWalletHomeViewButtonTypeFeedback,                 // 意见反馈
    NMWalletHomeViewButtonTypeLoginOut,                 // 退出登录
    NMWalletHomeViewButtonTypeLeftItem,                 // 左按钮
    NMWalletHomeViewButtonTypeRightItem                 // 右按钮
};


// 钱包首页-认证状态
typedef NS_ENUM (NSInteger, NMBaseInfoViewActionType){
    
    NMBaseInfoViewActionTypeInfo,                       // 基本信息
    NMBaseInfoViewActionTypeContacts,                   // 联系人
    NMBaseInfoViewActionTypePhone,                      // 手机认证
    NMBaseInfoViewActionTypeBankCard,                   // 银行卡
    NMBaseInfoViewActionTypeJD,                         // 京东
    NMBaseInfoViewActionTypeTB,                         // 淘宝
    NMBaseInfoViewActionTypeZM,                         // 芝麻
    NMBaseInfoViewActionTypeSB,                         // 社保
    NMBaseInfoViewActionTypeCredtCard,                  // 信用卡
    NMBaseInfoViewActionTypeGJJ                         // 公积金
};

// 采集信息-点击类型
typedef NS_ENUM (NSInteger, NMBaseInfoColloctionViewActionType){
    
    NMBaseInfoColloctionViewActionTypeFront,            // 身份证正面
    NMBaseInfoColloctionViewActionTypeReservse,         // 身份证反面
    NMBaseInfoColloctionViewActionTypeRecongniser,      // 人脸识别
    NMBaseInfoColloctionViewActionTypeSureButton        // 确认信息
};

// 认证中心-表单选择行类型
typedef NS_ENUM (NSInteger, NMACTableSelectedRowType){
    
    NMACTableSelectedRowTypeIsMarray,                   // 婚姻
    NMACTableSelectedRowTypeCity,                       // 现居城市
    NMACTableSelectedRowTypeIncome,                     // 收入来源
    NMACTableSelectedRowTypeEdu,                        // 学历
    NMACTableSelectedRowTypeRelation,                   // 关系
    NMACTableSelectedRowTypePhoneNum,                   // 电话
    NMACTableSelectedRowTypeOGN,                        // 组织
    NMACTableSelectedRowTypeindustry,                   // 所在行业
    NMACTableSelectedRowTypeMonthIncome,                // 月均收入
    NMACTableSelectedRowTypeCharacter,                  // 单位性质
    NMACTableSelectedRowTypeWorkTime,                   // 工作年限
    NMACTableSelectedRowTypeSure                        // 确认信息
};

// 认证中心-表单选择行类型
typedef NS_ENUM (NSInteger, NMNoDataViewType){
    
    NMNoDataViewTypeRefresh,                            // 刷新
    NMNoDataViewTypeAuditing,                           // 认证中
    NMNoDataViewTypeAuditingFailure,                    // 认证失败
    NMNoDataViewTypeAuditingServiceException,           // 认证服务器异常
    NMNoDataViewTypeCanNotRepayment,                    // 没有可还金额
};

// 认证中心-认证状态
typedef NS_ENUM (NSInteger, NMACViewItemStatusType){
    
    NMACViewItemStatusTypeUnAuth,                       // 未认证
    NMACViewItemStatusTypeSubmited,                     // 已提交
    NMACViewItemStatusTypeAuthed,                       // 已认证
    NMACViewItemStatusTypeDefeated                      // 认证失败
};

// 认证中心-认证结果状态
typedef NS_ENUM (NSInteger, NMACResultStatusType){
    NMACResultStatusTypeUnFilish,                       // 认证未完成
    NMACResultStatusTypeReAC,                           // 重新提交认证
    NMACResultStatusTypeFailed,                         // 认证失败
    NMACResultStatusTypeACing,                          // 认证中
    NMACResultStatusTypeFilish                          // 认证成功
};

// 认证中心-附件类型
typedef NS_OPTIONS(NSInteger, NMACViewRecogResultType) {
    NMACViewRecogResultTypeFront = 40103401,            // 身份证正面
    NMACViewRecogResultTypeBack = 40103402,             // 身份证反面
    NMACViewRecogResultTypeLive = 40103410              // 活体检测
};

// 认证中心-附件类型
typedef NS_OPTIONS(NSInteger, NMACViewLinkFaceType) {
    NMACViewLinkFaceTypeFront = 70000011,            // 身份证正面
    NMACViewLinkFaceTypeBack = 70000012,             // 身份证反面
    NMACViewLinkFaceTypeLive = 70000013              // 活体检测
};

// 消息中心-表单选择行类型
typedef NS_ENUM (NSInteger, NMMessageCenterTableSelectedRowType){
    
    NMMessageCenterTableSelectedRowTypeNotification,    // 通知消息
    NMMessageCenterTableSelectedRowTypeSystem,          // 系统消息
};

// 借款-借款首页
typedef NS_ENUM (NSInteger, NMBorrowViewActionType){
    
    NMBorrowViewActionTypeSlider,                       // 滑动条
    NMBorrowViewActionTypeTime,                         // 贷款天数
    NMBorrowViewActionTypeSubmit,                       // 提交
    NMBorrowViewActionTypeExplain                       // 借款说明
};

// 借款-借款结果
typedef NS_ENUM (NSInteger, NMBorrowResultViewActionType){
    
    NMBorrowResultViewActionTypeBackHome,               // 滑动条
    NMBorrowResultViewActionTypeMoreValue               // 贷款天数
};

// 账单-借款详情
typedef NS_ENUM (NSInteger, NMBorrowBillDetailViewActionType){
    
    NMBorrowBillDetailViewActionTypeOperability,        // 可操作栏
    NMBorrowBillDetailViewActionTypeContract,           // 催款合同
    NMBorrowBillDetailViewActionTypeRepaymentRecord     // 还款记录
};

// 还款-还款首页
typedef NS_ENUM (NSInteger, NMRepaymentViewActionType){
    
    NMRepaymentViewActionTypeSubmit,                    // 提交
    NMRepaymentViewActionTypeCalculate,                 // 试算利息
    NMRepaymentViewActionTypeBorrowRecode,              // 借款记录
    NMRepaymentViewActionTypeBill,                      // 账单
    NMRepaymentViewActionTypeRepaymetExplain            // 还款说明
};
typedef NS_ENUM (NSInteger, NMRepaymentDetailViewPaymentType){
    
    NMRepaymentDetailViewPaymentTypeLLPay,              // 连连
    NMRepaymentDetailViewPaymentTypeZJPay,              // 中金
};


// 还款 - 借款记录单条状态
typedef NS_ENUM (NSInteger, NMBorrowRecordListStatusType){
    NMBorrowRecordListStatusTypeDrawing = 30201093,       //提现中
    NMBorrowRecordListStatusTypeFailed = 30201091,       //提现失败
    NMBorrowRecordListStatusTypeDeduct = 30201094,       //扣款中
    NMBorrowRecordListStatusTypeEND = 30511007,         // 已还清
    NMBorrowRecordListStatusTypeNORMAL = 30511001,      // 正常使用
    NMBorrowRecordListStatusTypeOVDUED = 30511002,      // 已逾期 0~5
    NMBorrowRecordListStatusTypeOVDUEDA = 30511003,     // 已逾期 5~30
    NMBorrowRecordListStatusTypeOVDUEDB = 30511004,     // 已逾期 3~60
    NMBorrowRecordListStatusTypeOVDUEDC = 30511005,     // 已逾期 60~90
    NMBorrowRecordListStatusTypeOVDUEDD = 30511006,     // 已逾期 90~+
};

// 还款-还款首页
typedef NS_ENUM (NSInteger, NMToastViewType){
    
    NMToastViewTypeBorrowTip,                           // 借款提示
    NMToastViewTypeImageCode,                           // 图片验证码
    NMToastViewTypeContactAuth,                         // 通讯录权限
};

// 登录注册 - 登录注册页事件类型
typedef NS_ENUM (NSInteger, WLLoginAndApplyViewActionType){
    
    WLLoginAndApplyViewActionTypeCode,                        // 验证码
    WLLoginAndApplyViewActionTypeProtcol,                     // 注册协议
    WLLoginAndApplyViewActionTypeNextStep,                    // 下一步
    WLLoginAndApplyViewActionTypePhoneCallCode                //  语音验证
};

// 登录注册 - 图片验证码事件类型
typedef NS_ENUM (NSInteger, WLLoginAndApplyImageToastActionType){
    
    WLLoginAndApplyImageToastActionTypeCancel,                // 取消
    WLLoginAndApplyImageToastActionTypeSure,                  // 确定
    WLLoginAndApplyImageToastActionTypeReloadImage,           // 重新加载验证码
};

// 首页-激活状态
typedef NS_ENUM (NSInteger, NMHomeActivateStatusType){
    
    NMHomeActivateStatusTypekActivated = 70000003,      // 已激活
    NMHomeActivateStatusTypekUnActivate = 70000001,     // 未激活
    NMHomeActivateStatusTypekActivateing = 70000002,    // 激活中
    NMHomeActivateStatusTypekActivateFail = 70000005    // 激活失败
};
// 首页-交易密码状态
typedef NS_ENUM (NSInteger, NMHomeTradePwdStatusType){
    
    NMHomeTradePwdStatusTypeSeted = 10001001,           // 已设置
    NMHomeTradePwdStatusTypeUnset = 10001002            // 未设置
};
// 首页-是否定位
typedef NS_ENUM (NSInteger, NMHomeLocationType){
    
    NMHomeLocationTypeNeed = 10001001,                  // 需要定位
    NMHomeLocationTypeNoNeed = 10001002,                // 不需要定位
};

// 首页- 是否支持该区域
typedef NS_ENUM (NSInteger, NMHomeCanAuthStatusType){
    
    NMHomeCanAuthStatusTypeEnabel = 10001001,           // 支持
    NMHomeCanAuthStatusTypeDisabel = 10001002,          // 不支持
};


// 选择码值
typedef NS_ENUM (NSInteger, NMChooseCodeValueType){
    
    NMChooseCodeValueTypeSex,                           // 性别 40102101：男 女：40102102
    NMChooseCodeValueTypeMarray,                        // 婚姻状况  码值名称：marriage
    NMChooseCodeValueTypeEdu,                           // 学历    码值名称：education
    NMChooseCodeValueTypeCompany,                       // 现单位工作 ：码值名称：entryYear
    NMChooseCodeValueTypeIncome,                        // 工作收入 码值名称：incomeRange
    NMChooseCodeValueTypeIndustry,                      // 所属行业 码值名称：industry
    NMChooseCodeValueTypeUnit,                          // 单位性质 码值名称：unitTyp
    NMChooseCodeValueTypeRelation,                      // 关系：relationType
    NMChooseCodeValueTypeRelationLimit,                // 关系限定（直系）
    NMChooseCodeValueTypeogrnazation,                   // 开户机构  码值名称：chargeOpenOrg
    NMChooseCodeValueTypeAddress,                       // 选择地址
    NMChooseCodeValueTypeDate,                          // 选择日期
    NMChooseCodeValueTypeNation                         // 选择民族
};

// 获取码值
typedef NS_ENUM (NSInteger, NMGetCodeDataType){
    
    NMGetCodeDataTypeCodeToStr,                          // 码值->字符串
    NMGetCodeDataTypeStrToCode,                          // 字符串->码值
    NMGetCodeDataTypeModelArray,                         // 根据type获取 数据
};

// H5
typedef NS_ENUM (NSInteger, NMWebViewVCType){
    
    NMWebViewVCTypeAC,                                  // 提额
    NMWebViewVCTypeSigning,                             // 提现协议
    NMWebViewVCTypeApply,                               // 注册协议
    NMWebViewVCTypeContract,                            // 催款合同
    NMWebViewVCTypeACBankCard,                          // 银行卡认证
    NMWebViewVCTypePhoneNumber,                         // 手机认证
};

// 设置密码 - 类型
typedef NS_ENUM (NSInteger, NMSetTradePasswordVCType){
    
    NMSetTradePasswordVCTypeSet,                        // 设置交易密码
    NMSetTradePasswordVCTypeReset,                      // 重置
    NMSetTradePasswordVCTypeBorrow,                     // 借款输入交易密码
    NMSetTradePasswordVCTypeRepayment                   // 还款输入交易密码
};
// 设置密码 - 交互类型
typedef NS_ENUM (NSInteger, NMSetTradePasswordViewActionType){
    
    NMSetTradePasswordViewActionTypeFind,                       // 找回
    NMSetTradePasswordViewActionTypeOnce,                       // 设置交易密码第一次
    NMSetTradePasswordViewActionTypeTwice,                      // 设置交易密码第二次
};

// 意见反馈 - 留言类型
typedef NS_ENUM (NSInteger, NMFeedbackType){
    
    NMFeedbackTypeSuggest = 31511001,                      // 建议
    NMFeedbackTypeComplaint = 31511002,                    // 投诉
    NMFeedbackTypeOthers = 31511003,                       // 其他
    NMFeedbackTypeSibmit = 1                               // 提交
};


#endif
