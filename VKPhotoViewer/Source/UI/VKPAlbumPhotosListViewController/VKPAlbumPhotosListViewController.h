//
//  VKPAlbumPhotosListViewController.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VKPAlbumModel;

@protocol VKPAlbumPhotosListViewControllerDelegate;


@interface VKPAlbumPhotosListViewController : UIViewController
@property (nonatomic, weak) id<VKPAlbumPhotosListViewControllerDelegate>  delegate;

+ (instancetype)controllerWithAlbum:(VKPAlbumModel *)album;

@end
