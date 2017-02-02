//
//  VKPPhotoModel.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPPhotoModel.h"
#import "KSMacro.h"

KSConstString(kKSPhotoWidthSortKey, @"width");

KSConstString(kKSPhotoIdKey, @"id");
KSConstString(kKSPhotoSizesKey, @"sizes");
KSConstString(kKSPhotoURlKey, @"src");

@implementation VKPPhotoModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:kKSPhotoWidthSortKey ascending:YES];
        self.photoSizesArray = [self.photoSizesArray sortedArrayUsingDescriptors:@[sortDescriptor]];
        
        NSDictionary *thumbPhotoDictionary = self.photoSizesArray.firstObject;
        self.thumbPhotoUrl = [thumbPhotoDictionary valueForKey:kKSPhotoURlKey];
        NSDictionary *fullPhotoDictionary = self.photoSizesArray.lastObject;

        self.fullPhotoUrl = [fullPhotoDictionary valueForKey:kKSPhotoURlKey];
    }
    
    return self;
}

#pragma mark -
#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"photoId":kKSPhotoIdKey,
             @"photoSizesArray":kKSPhotoSizesKey};
}

@end
