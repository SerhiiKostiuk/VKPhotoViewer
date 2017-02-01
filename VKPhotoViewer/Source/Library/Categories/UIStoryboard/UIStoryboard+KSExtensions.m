//
//  UIStoryboard+KSExtensions.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "UIStoryboard+KSExtensions.h"

#import "VKPLoginViewConroller.h"

@implementation UIStoryboard (KSExtensions)

+ (instancetype)loginStoryboard {
    return [UIStoryboard storyboardWithName:NSStringFromClass([VKPLoginViewConroller class])
                                     bundle:nil];
}

@end
