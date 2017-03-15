//
//  MBProgressHUD+FX.m
//  MBProgress
//
//  Created by 王战胜 on 2017/3/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "MBProgressHUD+FX.h"

@implementation MBProgressHUD (FX)
#pragma mark 显示信息
+ (MBProgressHUD *)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    //快速显示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置文字
    hud.labelText = text;
    
    //设置图片
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",icon]]];
    
    //设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    //1.5秒后在消失
    [hud hide:YES afterDelay:1.5];
    
    return hud;
}

#pragma mark 显示成功信息
+ (void)showSuccess:(NSString *)success toView:(UIView *)view{
    [self show:success icon:@"success.png" view:view];
}

+ (void)showSuccess:(NSString *)success{
    [self show:success icon:@"success.png" view:nil];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showError:(NSString *)error{
    [self show:error icon:@"error.png" view:nil];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    //快速显示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置文字
    hud.labelText = message;
    
    //是否需要蒙版效果
    hud.dimBackground = YES;
    
    //1.5秒后在消失
//    [hud hide:YES afterDelay:1.5];
    
    return hud;
}

+ (MBProgressHUD *)showMessage:(NSString *)message{
    return [self showMessage:message toView:nil];
}

#pragma mark 隐藏HUD视图
+ (void)hideHUDForView:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD{
    [self hideHUDForView:nil];
}

@end
