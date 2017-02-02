//
//  VKPPhotoModel.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPPhotoModel.h"
#import "KSMacro.h"

KSConstString(kKSPhotoIdKey, @"id");
KSConstString(kKSPhotoSizesKey, @"sizes");
KSConstString(kKSPhotoURlKey, @"src");


@implementation VKPPhotoModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"width" ascending:YES];
        self.photoSizesArray = [self.photoSizesArray sortedArrayUsingDescriptors:@[sortDescriptor]];
        
        NSDictionary *thumbPhotoDictionary = self.photoSizesArray.firstObject;
        self.thumbPhotoUrl = [thumbPhotoDictionary valueForKey:kKSPhotoURlKey];
        NSDictionary *fullPhotoDictionary = self.photoSizesArray.lastObject;

        self.fullPhotoUrl = [fullPhotoDictionary valueForKey:kKSPhotoURlKey];
    }
    
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"photoId":kKSPhotoIdKey,
             @"photoSizesArray":kKSPhotoSizesKey};
}



@end
