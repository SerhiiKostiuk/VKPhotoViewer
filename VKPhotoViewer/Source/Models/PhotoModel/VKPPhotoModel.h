//
//  VKPPhotoModel.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VKPPhotoModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *photoId;
@property (nonatomic, strong) NSArray   *photoSizesArray;
@property (nonatomic, strong) NSURL     *fullPhotoUrl;
@property (nonatomic, strong) NSURL     *thumbPhotoUrl;

@end
