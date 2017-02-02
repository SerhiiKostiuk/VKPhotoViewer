//
//  VKPContext.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

@import VK_ios_sdk;

#import "VKPAppCoordinator.h"
#import "VKPAuthorizationCoordinator.h"

#import "VKPAlbumsListViewCotroller.h"
#import "VKPAlbumPhotosListViewController.h"

#import "VKPAuthorizationCoordinatorDelegate.h"
#import "VKPAlbumsListViewCotrollerDelegate.h"

#import "UIStoryboard+KSExtensions.h"

@interface VKPAppCoordinator () <VKPAuthorizationCoordinatorDelegate, VKPAlbumsListViewCotrollerDelegate>
@property (nonatomic, strong) VKPAuthorizationCoordinator *autorizationCoordinator;
@property (nonatomic, strong) UINavigationController *navigationViewController;
@end

@implementation VKPAppCoordinator

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        [self compositionRootSetup];
    }
    
    return self;
}

- (void)compositionRootSetup {
    
    UIStoryboard *storyboard = [UIStoryboard loginStoryboard];
    UINavigationController *navigationController = [storyboard instantiateInitialViewController];
    
    self.navigationViewController = navigationController;
    
    self.autorizationCoordinator = [[VKPAuthorizationCoordinator alloc] initWithNavigationController:navigationController];
    
    [self.autorizationCoordinator authorizeInVK];
    __weak typeof (self) weakSelf = self;
    
    [VKSdk wakeUpSession:@[@"photos"] completeBlock:^(VKAuthorizationState state, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if (state == VKAuthorizationAuthorized) {
            [strongSelf showAlbumListAnimated:NO];
        } else {
            
            
//            UIViewController *initialViewController = [strongSelf.autorizationCoordinator initialViewController];
            
//            strongSelf.navigationViewController.viewControllers = @[initialViewController];
        }
    }];
    
    
    
}

- (void)isUserLogin {

}

- (void)showAlbumListAnimated:(BOOL)animated {
    UINavigationController *navigationController = self.navigationViewController;
    
    navigationController.navigationBar.hidden = YES;

    UIStoryboard *storyboard = [UIStoryboard albumsListStoryboard];
    
    NSString *identifier = NSStringFromClass([VKPAlbumsListViewCotroller class]);

    VKPAlbumsListViewCotroller *albumsListViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    albumsListViewController.delegate = self;
    
    [navigationController pushViewController:albumsListViewController animated:animated];
}

#pragma mark -
#pragma mark VKPAuthorizationCoordinatorDelegate

- (void)authorizationCoordinatorDidFinishAuthorization:(VKPAuthorizationCoordinator *)authorizationCoordinator {
    [self showAlbumListAnimated:YES];
}

#pragma mark - 
#pragma mark VKPAlbumsListViewCotrollerDelegate

- (void)albumsListViewCotrollerDidTapLogout:(VKPAlbumsListViewCotroller *)albumsListViewController {
    [VKSdk forceLogout];
}

- (void)albumsListViewCotroller:(VKPAlbumsListViewCotroller *)albumsListViewController didSelectAlbum:(VKPAlbumModel *)album {
    
    UINavigationController *navigationController = self.navigationViewController;
    
    VKPAlbumPhotosListViewController *albumPhotosListViewController = [VKPAlbumPhotosListViewController controllerWithAlbum:album];
    
    [navigationController pushViewController:albumPhotosListViewController animated:YES];
}


@end
