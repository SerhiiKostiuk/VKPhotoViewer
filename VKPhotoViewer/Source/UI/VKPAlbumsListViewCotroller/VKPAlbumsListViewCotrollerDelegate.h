//
//  VKPAlbumsListViewCotrollerDelegate.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VKPAlbumsListViewCotroller;
@class VKPAlbumModel;

@protocol VKPAlbumsListViewCotrollerDelegate <NSObject>

- (void)albumsListViewCotrollerDidTapLogout:(VKPAlbumsListViewCotroller *)albumsListViewController;
- (void)albumsListViewCotroller:(VKPAlbumsListViewCotroller *)albumsListViewController didSelectAlbum:(VKPAlbumModel *)album;
@end
