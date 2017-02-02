//
//  ApiManager.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^getAlbumsCompletion)(NSArray *albums, NSError *error);
typedef void(^getPhotosCompletion)(NSArray *photos, NSError *error);

@class VKRequest;
@class VKPAlbumModel;

@interface ApiManager : NSObject

+ (instancetype)sharedApiManager;

- (VKRequest *)getAlbumsWithCompletion:(getAlbumsCompletion)completion;
- (VKRequest *)getPhotosFromAlbum:(VKPAlbumModel *)album withCompletion:(getPhotosCompletion)completion;

@end
