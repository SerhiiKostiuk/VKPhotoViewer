//
//  VKPPhotoDetailViewContoller.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VKPPhotoModel;

@protocol VKPPhotoDetailViewContollerDelegate;

@interface VKPPhotoDetailViewContoller : UIViewController
@property (nonatomic, weak) id<VKPPhotoDetailViewContollerDelegate>  delegate;

+ (instancetype)controllerWithPhoto:(VKPPhotoModel *)photo;

@end
