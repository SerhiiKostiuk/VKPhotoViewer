//
//  VKPAlbumsListViewCotroller.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol VKPAlbumsListViewCotrollerDelegate;

@interface VKPAlbumsListViewCotroller : UIViewController
@property (nonatomic, weak) id<VKPAlbumsListViewCotrollerDelegate>  delegate;

@end
