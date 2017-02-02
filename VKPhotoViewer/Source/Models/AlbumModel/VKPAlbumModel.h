//
//  VKPAlbumModel.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VKPAlbumModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber  *albumId;
@property (nonatomic, strong) NSNumber  *ownerId;
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *albumDescription;
@property (nonatomic, strong) NSURL     *thumbUrl;

@end
