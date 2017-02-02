//
//  VKPAuthorizationCoordinator.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

@import VK_ios_sdk;

#import "VKPAuthorizationCoordinator.h"
#import "VKPAuthorizationCoordinatorDelegate.h"

#import "VKPLoginViewController.h"
#import "UIAlertController+KSExtensions.h"

#import "KSMacro.h"

KSConstString(app_id, @"5852623");

@interface VKPAuthorizationCoordinator () <VKSdkDelegate>
@property (nonatomic, strong)   UINavigationController  *navigationController;
@property (nonatomic, strong)   VKPLoginViewController  *loginController;

@end

@implementation VKPAuthorizationCoordinator

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithNavigationController:nil];
}

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    self.navigationController = navigationController;
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)authorizeInVK {
    VKSdk *vksdk = [VKSdk initializeWithAppId:app_id];
    [vksdk registerDelegate:self];
}

- (UIViewController *)initialViewController {
    if (nil == self.loginController) {
        self.loginController = [VKPLoginViewController new];
    }
    
    return self.loginController;
}

#pragma mark - VKSdkDelegate

- (void)vkSdkAccessAuthorizationFinishedWithResult:(VKAuthorizationResult *)result {
    if (result.error) {
        [UIAlertController presentAlertControllerWithMessage:result.error.localizedDescription inController:self.loginController];
        return;
    }
    
    [self.delegate authorizationCoordinatorDidFinishAuthorization:self];
}

- (void)vkSdkUserAuthorizationFailed {
    [UIAlertController presentAlertControllerWithMessage:@"Authorization failed" inController:self.loginController];
}

@end
