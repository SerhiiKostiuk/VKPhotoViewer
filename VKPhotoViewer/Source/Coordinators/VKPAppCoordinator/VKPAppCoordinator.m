//
//  VKPContext.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

@import VK_ios_sdk;

#import "VKPAppCoordinator.h"
#import "UIStoryboard+KSExtensions.h"
#import "VKPAuthorizationCoordinator.h"



@interface VKPAppCoordinator ()
@property (nonatomic, strong) VKPAuthorizationCoordinator *autorizationCoordinator;
@property (nonatomic, strong) UINavigationController *navigationViewController;
@end

@implementation VKPAppCoordinator

- (void)compositionRootSetup {
    
    UIStoryboard *storyboard = [UIStoryboard loginStoryboard];
    UINavigationController *navigationController = [storyboard instantiateInitialViewController];
    
    self.autorizationCoordinator = [[VKPAuthorizationCoordinator alloc] initWithNavigationController:navigationController];
    
    UIViewController *initialViewController = [self.autorizationCoordinator initialViewController];
    
    self.navigationViewController.viewControllers = @[initialViewController];
    
}

- (void)isUserLogin {
    __weak typeof (self) weakSelf = self;

    
    [VKSdk wakeUpSession:@[@"photos"] completeBlock:^(VKAuthorizationState state, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;

        if (state == VKAuthorizationAuthorized) {
            [self showControllerWithClass:[AlbumsViewController class]];
        } else {
            [self showControllerWithClass:[LoginViewController class]];
        }
    }];
}

- (void)showAlbumListAnimated:(BOOL)animated {
    
}

@end
