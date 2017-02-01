//
//  VKPAuthorizationCoordinator.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

@import VK_ios_sdk;

#import "VKPAuthorizationCoordinator.h"
#import "VKPUserPersistence.h"
#import "VKPUserPersistenceProtocol.h"
#import "VKPAuthorizationCoordinatorDelegate.h"

#import "VKPUser.h"
#import "VKPLoginViewConroller.h"
#import "UIAlertController+KSExtensions.h"

#import "KSMacro.h"

KSConstString(app_id, @"5852623");

@interface VKPAuthorizationCoordinator () <VKSdkDelegate>
@property (nonatomic, strong)   id<VKPUserPersistenceProtocol>      userPersistence;

@property (nonatomic, strong)   UINavigationController              *navigationController;
@property (nonatomic, strong)   VKPLoginViewConroller               *loginController;

@end


@implementation VKPAuthorizationCoordinator

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super init];
    self.navigationController = navigationController;
//    self.userPersistence = userPersistence;
    
    VKSdk *vksdk = [VKSdk initializeWithAppId:app_id];
    [vksdk registerDelegate:self];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (UIViewController *)initialViewController {
//    VKPUser *user = [self.userPersistence savedUser];
    
    if (nil == self.loginController) {
        self.loginController = [VKPLoginViewConroller new];
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
//    [self showControllerWithClass:[AlbumsViewController class]];
}

- (void)vkSdkUserAuthorizationFailed {
    [UIAlertController presentAlertControllerWithMessage:@"Authorization failed" inController:self.loginController];
}

@end
