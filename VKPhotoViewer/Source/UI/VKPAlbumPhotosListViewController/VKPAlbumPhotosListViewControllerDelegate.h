//
//  VKPAlbumPhotosListViewControllerDelegate.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VKPAlbumPhotosListViewController;
@class VKPPhotoModel;

@protocol VKPAlbumPhotosListViewControllerDelegate <NSObject>

- (void)albumsPhotosListViewCotrollerDidTapBack:(VKPAlbumPhotosListViewController *)albumPhotosListViewController;
- (void)albumsPhotosListViewCotroller:(VKPAlbumPhotosListViewController *)albumPhotosListViewController didSelectPhoto:(VKPPhotoModel *)photo;

@end
