//
//  UIStoryboard+KSExtensions.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "UIStoryboard+KSExtensions.h"

#import "VKPLoginViewController.h"
#import "VKPAlbumsListViewCotroller.h"
#import "VKPAlbumPhotosListViewController.h"
#import "VKPPhotoDetailViewContoller.h"

@implementation UIStoryboard (KSExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loginStoryboard {
    return [UIStoryboard storyboardWithName:NSStringFromClass([VKPLoginViewController class])
                                     bundle:nil];
}

+ (instancetype)albumsListStoryboard {
    return [UIStoryboard storyboardWithName:NSStringFromClass([VKPAlbumsListViewCotroller class])
                                     bundle:nil];
}

+ (instancetype)albumPhotosListStoryboard {
    return [UIStoryboard storyboardWithName:NSStringFromClass([VKPAlbumPhotosListViewController class])
                                     bundle:nil];
}

+ (instancetype)photoDetailStoryboard {
    return [UIStoryboard storyboardWithName:NSStringFromClass([VKPPhotoDetailViewContoller class])
                                     bundle:nil];
}

@end
