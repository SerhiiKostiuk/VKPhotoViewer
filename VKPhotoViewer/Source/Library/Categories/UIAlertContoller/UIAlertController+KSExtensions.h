//
//  UIViewController+KSExtensions.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (KSExtensions)

+ (void)presentAlertControllerWithMessage:(NSString *)message inController:(UIViewController *)controller;

@end
