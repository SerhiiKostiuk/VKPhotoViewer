//
//  VKPLoginViewController.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

@import VK_ios_sdk;

#import "VKPLoginViewController.h"

@interface VKPLoginViewController () <VKSdkUIDelegate>

@end

@implementation VKPLoginViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[VKSdk instance] setUiDelegate:self];
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onSignIn:(id)sender {
    [VKSdk authorize:@[@"photos"]];
}

#pragma mark -
#pragma mark VKSdkUIDelegate

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
    VKCaptchaViewController *captchaController = [VKCaptchaViewController captchaControllerWithError:captchaError];
    [captchaController presentIn:self];
}

@end
