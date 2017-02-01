//
//  VKPAuthorizationCoordinatorDelegate.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VKPAuthorizationCoordinator;

@protocol VKPAuthorizationCoordinatorDelegate <NSObject>

- (void)authorizationCoordinatorDidFinishAuthorization:(VKPAuthorizationCoordinator *)authorizationCoordinator;

@end
