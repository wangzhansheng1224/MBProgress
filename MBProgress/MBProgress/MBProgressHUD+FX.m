//
//  MBProgressHUD+FX.m
//  MBProgress
//
//  Created by 王战胜 on 2017/3/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "MBProgressHUD+FX.h"

@implementation MBProgressHUD (FX)
#pragma mark 显示标准信息
+ (MBProgressHUD *)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    //快速显示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置文字
    hud.labelText = text;
    
    //设置详细文字
//    hud.detailsLabelText = @"详细内容";
    
    //设置图片
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",icon]]];
    
    //设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    //向下偏移
//    hud.yOffset = 200;
    
    //1.5秒后在消失
    [hud hide:YES afterDelay:1.5];
    
    return hud;
}

#pragma mark 显示成功信息
+ (MBProgressHUD *)showSuccess:(NSString *)success toView:(UIView *)view{
    return [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示错误信息
+ (MBProgressHUD *)showError:(NSString *)error toView:(UIView *)view{
    return [self show:error icon:@"error.png" view:view];
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

#pragma mark 进度条缓慢显示
+ (MBProgressHUD *)showProgress1:(NSString *)message toView:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    //快速显示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置确定的模式来显示任务的进展.
    hud.mode = MBProgressHUDModeDeterminate;
    
    //设置文字
    hud.labelText = message;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideHUDForView:nil];
        });
    });
    
    return hud;
}

+ (MBProgressHUD *)showProgress2:(NSString *)message toView:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    //快速显示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置确定的模式来显示任务的进展.
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    
    //设置文字
    hud.labelText = message;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideHUDForView:nil];
        });
    });
    
    return hud;
}

+ (MBProgressHUD *)showProgress3:(NSString *)message toView:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    //快速显示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    //设置确定的模式来显示任务的进展.
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    //设置文字
    hud.labelText = message;
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hideHUDForView:nil];
        });
    });
    
    return hud;
}

+ (void)doSomeWorkWithProgress {
    BOOL canceled = NO;
    // This just increases the progress indicator in a loop.
    float progress = 0.0f;
    while (progress < 1.0f) {
        if (canceled) break;
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            // Instead we could have also passed a reference to the HUD
            // to the HUD to myProgressTask as a method parameter.
            [MBProgressHUD HUDForView:[[UIApplication sharedApplication].windows lastObject]].progress = progress;
        });
        usleep(50000);
    }
}

#pragma mark 隐藏HUD视图
+ (void)hideHUDForView:(UIView *)view{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    
    [self hideHUDForView:view animated:YES];
}

@end
