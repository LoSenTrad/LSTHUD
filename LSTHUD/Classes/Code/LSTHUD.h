//
//  LSTHUB.h
//
//  Created by LoSenTrad on 2017/12/1.
//  Copyright © 2017年 LoSenTrad. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>



@interface LSTHUD : NSObject


/** 显示message提示InWindow 默认1.2秒之后消失 */
+ (void)showTipMsgInWindow:(NSString*)message;
/** 显示message提示InWindow hideTime秒后消失 */
+ (void)showTipMsgInWindow:(NSString*)message time:(CGFloat)hideTime;

/** 显示message提示InView 默认1.5秒之后消失 */
+ (void)showTipMsgInView:(NSString*)message;
/** 显示message提示InView hideTime秒后消失 */
+ (void)showTipMsgInView:(NSString*)message time:(CGFloat)hideTime;


/** 等待提示InWindow 不消失 */
+ (void)showLoadingMsgInWindow;

/** 等待提示InWindow 不消失 */
+ (void)showLoadingMsgInWindow:(NSString*)message;
/** 等待提示InWindow hideTime消失 */
+ (void)showLoadingMsgInWindow:(NSString*)message time:(CGFloat)hideTime;

/** 等待提示InView 不消失 */
+ (void)showLoadingMsgInView;
/** 等待提示InView 不消失 */
+ (void)showLoadingMsgInView:(NSString*)message;
/** 等待提示InWindow hideTime消失 */
+ (void)showLoadingMsgInView:(NSString*)message time:(CGFloat)hideTime;


/** 成功显示 默认1.5秒后消失*/
+ (void)showSuccessMsg:(NSString *)Message;
/** 错误显示 默认1.5秒后消失*/
+ (void)showErrorMsg:(NSString *)Message;
/** 普通显示 默认1.5秒后消失*/
+ (void)showInfoMsg:(NSString *)Message;
/** 警告提示 默认1.5秒后消失*/
+ (void)showWarnMsg:(NSString *)Message;

/** 自定义图片 */
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;
/** 自定义图片 */
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;
/**自定义偏移*/
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message Offset:(CGFloat)offset isWindow:(BOOL)isWindow;

/** 移除hub */
+ (void)hideHUD;


//创建单例
+ (LSTHUD *)shareLSTHUB;

#pragma mark - ***** 属性设置 *****
//显示hud之后,是否可以进行其他操作
//+ (void)setUserInteraction:(BOOL)isOpen;


@end
