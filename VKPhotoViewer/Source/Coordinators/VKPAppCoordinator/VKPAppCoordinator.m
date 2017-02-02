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
#import "VKPPhotoDetailViewContoller.h"

#import "VKPAuthorizationCoordinatorDelegate.h"
#import "VKPAlbumsListViewCotrollerDelegate.h"
#import "VKPAlbumPhotosListViewControllerDelegate.h"
#import "VKPPhotoDetailViewContollerDelegate.h"

#import "UIStoryboard+KSExtensions.h"

@interface VKPAppCoordinator () <VKPAuthorizationCoordinatorDelegate,
                                 VKPAlbumsListViewCotrollerDelegate,
                                 VKPAlbumPhotosListViewControllerDelegate,
                                 VKPPhotoDetailViewContollerDelegate>

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

#pragma mark -
#pragma mark Private Root Setup

- (void)compositionRootSetup {
    UIStoryboard *storyboard = [UIStoryboard loginStoryboard];
    UINavigationController *navigationController = [storyboard instantiateInitialViewController];
    
    self.navigationViewController = navigationController;
    
    self.autorizationCoordinator = [[VKPAuthorizationCoordinator alloc] initWithNavigationController:navigationController];
    
    self.autorizationCoordinator.delegate = self;
    
    [self.autorizationCoordinator initialViewController];
    [self.autorizationCoordinator authorizeInVK];
    
    [self isUserLogin];
}

#pragma mark -
#pragma mark Check is user logged on

- (void)isUserLogin {
    __weak typeof (self) weakSelf = self;
    
    [VKSdk wakeUpSession:@[@"photos"] completeBlock:^(VKAuthorizationState state, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        if (state == VKAuthorizationAuthorized) {
            [strongSelf showAlbumListAnimated:NO];
        }
    }];
}

#pragma mark -
#pragma mark Album List View Controller showing

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
    [self.navigationViewController popViewControllerAnimated:YES];
}

- (void)albumsListViewCotroller:(VKPAlbumsListViewCotroller *)albumsListViewController didSelectAlbum:(VKPAlbumModel *)album {
    VKPAlbumPhotosListViewController *albumPhotosListViewController = [VKPAlbumPhotosListViewController controllerWithAlbum:album];
    albumPhotosListViewController.delegate = self;
    
    [self.navigationViewController pushViewController:albumPhotosListViewController animated:YES];
}

#pragma mark -
#pragma mark VKPAlbumPhotosListViewControllerDelegate

- (void)albumsPhotosListViewCotroller:(VKPAlbumPhotosListViewController *)albumPhotosListViewController
                       didSelectPhoto:(VKPPhotoModel *)photo
{
    VKPPhotoDetailViewContoller *photoDetailViewController = [VKPPhotoDetailViewContoller controllerWithPhoto:photo];
    photoDetailViewController.delegate = self;
    
    [self.navigationViewController pushViewController:photoDetailViewController animated:YES];
}

- (void)albumsPhotosListViewCotrollerDidTapBack:(VKPAlbumPhotosListViewController *)albumPhotosListViewController {
    [self.navigationViewController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark VKPPhotoDetailViewContollerDelegate

- (void)photoDetailViewCotrollerDidTapBack:(VKPPhotoDetailViewContoller *)photoDetailViewController {
    [self.navigationViewController popViewControllerAnimated:YES];
}

@end
