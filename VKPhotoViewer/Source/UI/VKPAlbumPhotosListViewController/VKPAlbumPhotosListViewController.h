//
//  VKPAlbumPhotosListViewController.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VKPAlbumModel;

@interface VKPAlbumPhotosListViewController : UIViewController

+ (instancetype)controllerWithAlbum:(VKPAlbumModel *)album;

@end
