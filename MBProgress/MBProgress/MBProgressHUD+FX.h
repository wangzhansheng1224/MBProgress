//
//  MBProgressHUD+FX.h
//  MBProgress
//
//  Created by 王战胜 on 2017/3/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (FX)

/**
 显示标准信息

 @param text 自定义字符串
 @param icon 目标图片
 @param view 目标视图
 @return     MBProgressHUD对象
 */
+ (MBProgressHUD *)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;

/**
 显示成功信息,附带目标视图

 @param success 自定义字符串
 @param view    目标视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

/**
 显示成功信息

 @param success 自定义字符串
 */
+ (void)showSuccess:(NSString *)success;

/**
 显示错误信息

 @param error 自定义字符串
 @param view  目标视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;

/**
 显示错误信息

 @param error 自定义字符串
 */
+ (void)showError:(NSString *)error;


/**
 显示一些信息

 @param message 自定义信息
 @param view    目标视图
 @return        MBProgressHUD对象
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

/**
 显示一些信息

 @param message 自定义信息
 @return        MBProgressHUD对象
 */
+ (MBProgressHUD *)showMessage:(NSString *)message;

/**
 从对应视图隐藏HUD

 @param view 目标视图
 */
+ (void)hideHUDForView:(UIView *)view;

/**
 隐藏HUD
 */
+ (void)hideHUD;

@end
