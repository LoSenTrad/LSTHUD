//
//  LSTHUB.m
//
//  Created by LoSenTrad on 2017/12/1.
//  Copyright © 2017年 LoSenTrad. All rights reserved.
//

#import "LSTHUD.h"
#import "UIColor+LSTColor.h"


static LSTHUD *singleInstance = nil;
static CGFloat LSTHUDBGAlpha = 0.4;


/**
 物理屏幕尺寸
 */
#define LST_kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LST_kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation LSTHUD

//初始化hub对象
+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message isWindiw:(BOOL)isWindow {
    UIView  *view = isWindow? (UIView*)[UIApplication sharedApplication].delegate.window:[self getCurrentUIVC].view;
    
//    LSTHUB *temp = [LSTHUB shareLSTHUB];
    [LSTHUD hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.margin = 20;
//    hud.bezelView.alpha = 0.8;
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = message?message:@"";
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.removeFromSuperViewOnHide = YES;
//    hud.userInteractionEnabled = NO;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    
   hud.bezelView.backgroundColor = [UIColor lst_ColorWith8BitRed:0 green:0 blue:0 alpha:LSTHUDBGAlpha];

    return hud;
}
//创建自定义icon hub
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow {
 
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.mode = MBProgressHUDModeCustomView;

    hud.bezelView.backgroundColor = [UIColor lst_ColorWith8BitRed:0 green:0 blue:0 alpha:LSTHUDBGAlpha];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.alpha = 0.8;
    hud.minSize  = CGSizeMake(30,30);
    hud.userInteractionEnabled = NO;
    hud.animationType = MBProgressHUDAnimationFade;
    hud.defaultMotionEffectsEnabled = NO;
//    [hud hide:YES afterDelay:1.2];
    [hud hideAnimated:YES afterDelay:1.5];
}

//创建自定义Frame hud
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message Offset:(CGFloat)offset isWindow:(BOOL)isWindow{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    if (iconName == nil) {
        hud.mode = MBProgressHUDModeText;
    }else{
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
        hud.mode = MBProgressHUDModeCustomView;
    }
//    hud.activityIndicatorColor = [UIColor blackColor];
    //    hud.margin = 25;
    hud.bezelView.backgroundColor = [UIColor lst_ColorWith8BitRed:0 green:0 blue:0 alpha:LSTHUDBGAlpha];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.alpha = 1;
    hud.minSize  = CGSizeMake(LST_kSCREEN_WIDTH,20);
//    hud.size = CGSizeMake(LSTScreenWidth(),20);
    hud.userInteractionEnabled = NO;
//    [hud setCenterY:10];
//    [hud setWidth:LSTScreenWidth()];
//    [hud setHeight:20];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.defaultMotionEffectsEnabled = NO;
    //    [hud hide:YES afterDelay:1.2];
    [hud hideAnimated:YES afterDelay:1.5];
}

#pragma mark - ***** show Tip *****

+ (void)showTipMsgInWindow:(NSString*)message {
    [self showTipMessage:message isWindow:true time:1];
}

+ (void)showTipMsgInView:(NSString*)message {
    [self showTipMessage:message isWindow:false time:1];
}

+ (void)showTipMsgInWindow:(NSString*)message time:(CGFloat)hideTime {
    [self showTipMessage:message isWindow:true time:hideTime];
}

+ (void)showTipMsgInView:(NSString*)message time:(CGFloat)hideTime {
    [self showTipMessage:message isWindow:false time:hideTime];
}

+ (void)showTipMessage:(NSString*)message isWindow:(BOOL)isWindow time:(CGFloat)hideTime {
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeText;
    hud.animationType = MBProgressHUDAnimationFade;
    [hud hideAnimated:YES afterDelay:hideTime];
}

#pragma mark - ***** show message *****

+ (void)showLoadingMsgInWindow {
    [self showActivityMessage:@"" isWindow:true time:0];
}

+ (void)showLoadingMsgInWindow:(NSString*)message {
    [self showActivityMessage:message isWindow:true time:0];
}

+ (void)showLoadingMsgInView {
    [self showActivityMessage:@"" isWindow:false time:0];
}

+ (void)showLoadingMsgInView:(NSString*)message {
    [self showActivityMessage:message isWindow:false time:0];
}
+ (void)showLoadingMsgInWindow:(NSString*)message time:(CGFloat)hideTime {
    [self showActivityMessage:message isWindow:true time:hideTime];
}
+ (void)showLoadingMsgInView:(NSString*)message time:(CGFloat)hideTime {
    [self showActivityMessage:message isWindow:false time:hideTime];
}
+ (void)showActivityMessage:(NSString*)message isWindow:(BOOL)isWindow time:(CGFloat)timer {
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message isWindiw:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.margin = 25;
    hud.animationType = MBProgressHUDAnimationFade;
    if (timer>0) {
        [hud hideAnimated:YES afterDelay:timer];
    }
//    else {
//        [hud hideAnimated:YES afterDelay:1.5];
//    }
}

#pragma mark - ***** show Image *****

+ (void)showSuccessMsg:(NSString *)Message {
    NSString *name =@"MBHUD_Success";
    [self showCustomIconInWindow:name message:Message];
}
+ (void)showErrorMsg:(NSString *)Message {
    NSString *name =@"MBHUD_Error";
    [self showCustomIconInWindow:name message:Message];
}
+ (void)showInfoMsg:(NSString *)Message {
    NSString *name =@"MBHUD_Info";
    [self showCustomIconInWindow:name message:Message];
}
+ (void)showWarnMsg:(NSString *)Message {
    NSString *name =@"MBHUD_Warn";
    [self showCustomIconInWindow:name message:Message];
}
+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message {
    [self showCustomIcon:iconName message:message isWindow:true];
    
}
+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message {
    [self showCustomIcon:iconName message:message isWindow:false];
}

#pragma mark - ***** 属性设置 *****

//+ (void)setUserInteraction:(BOOL)isOpen {
//    MBProgressHUD *hud = [MBProgressHUD ]
//}

#pragma mark - ***** other *****

+ (void)hideHUD {
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;

    [MBProgressHUD hideHUDForView:winView animated:YES];
    [MBProgressHUD hideHUDForView:[self getCurrentUIVC].view animated:YES];
    
//    [MBProgressHUD hideAllHUDsForView:winView animated:YES];
//    [MBProgressHUD hideAllHUDsForView:[self getCurrentUIVC].view animated:YES];
}
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentUIVC {
    //获得当前活动窗口的根视图
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1){
        //根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
            if ([vc isKindOfClass:[UITabBarController class]]) {
                vc = ((UITabBarController*)vc).selectedViewController;
            }
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

//创建单例
+ (LSTHUD *)shareLSTHUB {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleInstance = [[LSTHUD alloc] init];
    });
    return singleInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleInstance = [super allocWithZone:zone];
    });
    return singleInstance;
}


@end
