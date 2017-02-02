//
//  UIViewController+KSExtensions.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "UIAlertController+KSExtensions.h"

@implementation UIAlertController (KSExtensions)

#pragma mark -
#pragma mark Class Methods

+ (void)presentAlertControllerWithMessage:(NSString *)message inController:(UIViewController *)controller {
    UIAlertController * alert= [UIAlertController alertControllerWithTitle:nil
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alert addAction:okAction];

    void (^presentBlock)() = ^{
        [controller presentViewController:alert animated:YES completion:nil];
    };
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), presentBlock);
    } else {
        presentBlock();
    }
}


@end
