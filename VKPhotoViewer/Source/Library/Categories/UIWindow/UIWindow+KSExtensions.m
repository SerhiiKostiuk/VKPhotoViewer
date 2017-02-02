//
//  UIWindow+KSExtensions.m
//  VKPhotoViewer
//
//  Created by Serhii Kostiuk on 14.11.16.
//  Copyright © 2016 Serhii Kostiuk. All rights reserved.
//

#import "UIWindow+KSExtensions.h"

@implementation UIWindow (KSExtensions)

#pragma mark -
#pragma mark Class Methods


+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
			
