//
//  VKPAlbumModel.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//
@import Foundation;

#import "VKPAlbumModel.h"

#import "KSMacro.h"

KSConstString(kKSAlbumIdKey, @"id");
KSConstString(kKSAlbumOwnerIdKey, @"owner_id");
KSConstString(kKSAlbumTitleKey, @"title");
KSConstString(kKSAlbumDescriptionKey, @"description");
KSConstString(kKSAlbumThumbSourceKey, @"thumb_src");

@implementation VKPAlbumModel

#pragma mark -
#pragma mark Private

+ (NSValueTransformer *)thumbUrlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

#pragma mark - 
#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"albumId":kKSAlbumIdKey,
             @"ownerId":kKSAlbumOwnerIdKey,
             @"title":kKSAlbumTitleKey,
             @"albumDescription":kKSAlbumDescriptionKey,
             @"thumbUrl":kKSAlbumThumbSourceKey,
             };
}

@end
