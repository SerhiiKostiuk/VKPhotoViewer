//
//  VKPPhotoDetailViewContollerDelegate.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VKPPhotoDetailViewContoller;

@protocol VKPPhotoDetailViewContollerDelegate <NSObject>

- (void)photoDetailViewCotrollerDidTapBack:(VKPPhotoDetailViewContoller *)photoDetailViewController;

@end
