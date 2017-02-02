//
//  MBProgressHUD+KSExtensions.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "MBProgressHUD+KSExtensions.h"

#import "AppDelegate.h"

@implementation MBProgressHUD (KSExtensions)

#pragma mark -
#pragma mark Class Methods

+ (void)show {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    MBProgressHUD *HUD = [self showHUDAddedTo:window animated:YES];
    HUD.contentColor = [UIColor whiteColor];
    HUD.bezelView.color = [UIColor blackColor];
    HUD.backgroundView.color = [UIColor colorWithWhite:0.1 alpha:0.3];
    HUD.minShowTime = 0.5;
}

+ (void)hide {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    [self hideHUDForView:window animated:YES];
}

@end
