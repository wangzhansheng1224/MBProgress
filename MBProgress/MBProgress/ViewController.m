//
//  ViewController.m
//  MBProgress
//
//  Created by 王战胜 on 2017/3/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+FX.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnResult1:(UIButton *)sender {
    [MBProgressHUD show:@"你好" icon:nil view:nil];
}

- (IBAction)btnResult2:(UIButton *)sender {
    [MBProgressHUD showSuccess:@"加载成功" toView:nil];
}

- (IBAction)btnResult3:(id)sender {
    [MBProgressHUD showError:@"加载失败" toView:nil];
}

- (IBAction)btnResult4:(UIButton *)sender {
    MBProgressHUD *hud = [MBProgressHUD showMessage:nil toView:nil];
    [hud hide:YES afterDelay:2.0f];
//    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
//    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUDForView:nil];
//    });
}

- (IBAction)btnResult5:(UIButton *)sender {
    [MBProgressHUD showProgress1:@"正在加载中..." toView:nil];
}

- (IBAction)btnResult6:(UIButton *)sender {
    [MBProgressHUD showProgress2:@"正在加载中..." toView:nil];
}

- (IBAction)btnResult7:(UIButton *)sender {
    [MBProgressHUD showProgress3:@"正在加载中..." toView:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
