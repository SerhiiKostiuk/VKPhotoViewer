//
//  VKPAuthorizationCoordinator.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

@import UIKit;
@import Foundation;

@protocol VKPAuthorizationCoordinatorDelegate;

@interface VKPAuthorizationCoordinator : NSObject
@property (nonatomic, weak) id<VKPAuthorizationCoordinatorDelegate> delegate;

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController NS_DESIGNATED_INITIALIZER;

- (void)authorizeInVK;

- (UIViewController *)initialViewController;

@end
