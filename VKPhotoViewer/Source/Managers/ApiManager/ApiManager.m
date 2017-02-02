//
//  ApiManager.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

@import VK_ios_sdk;
@import Mantle;

#import "ApiManager.h"
#import "KSMacro.h"
#import "VKPAlbumModel.h"
#import "VKPPhotoModel.h"

KSConstString(kKSRequestAlbumsString, @"photos.getAlbums");
KSConstString(kKSNeedCoversString, @"need_covers");

KSConstString(kKSParametersOwnerIdString, @"owner_id");
KSConstString(kKSParametersAlbumIdString, @"album_id");
KSConstString(kKSParametersPhotosSizesString, @"photo_sizes");

KSConstString(kKSRequestPhotosString, @"photos.get");

@implementation ApiManager

#pragma mark -
#pragma mark Singelton

+ (instancetype)sharedApiManager {
    static id apiManager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        apiManager = [[self alloc] init];
    });
    
    return apiManager;
}

#pragma mark -
#pragma mark Public Request Methods 

- (VKRequest *)getAlbumsWithCompletion:(getAlbumsCompletion)completion  {
    NSDictionary *parameters = @{VK_API_OWNER_ID:[VKSdk accessToken].userId, kKSNeedCoversString:@1};
    
    VKRequest *request = [VKRequest requestWithMethod:kKSRequestAlbumsString parameters:parameters];
    
    [request executeWithResultBlock:^(VKResponse *response) {
        NSArray *items = response.json[@"items"];
        NSMutableArray *albums = [NSMutableArray array];
        
        for (NSDictionary *dictionary in items) {
            NSError *error;
            VKPAlbumModel *album = [MTLJSONAdapter modelOfClass:[VKPAlbumModel class] fromJSONDictionary:dictionary error:&error];
            if (!error) {
                [albums addObject:album];
            }
        }
        completion([albums copy], nil);
        
    } errorBlock:^(NSError *error){
        completion(nil, error);
    }];
    
    return request;
}

- (VKRequest *)getPhotosFromAlbum:(VKPAlbumModel *)album withCompletion:(getPhotosCompletion)completion {
    NSDictionary *parameters = @{ kKSParametersOwnerIdString : album.ownerId,
                                  kKSParametersAlbumIdString : album.albumId,
                                  kKSParametersPhotosSizesString : @1 };
    
    VKRequest *request = [VKRequest requestWithMethod:kKSRequestPhotosString parameters:parameters];
    
    [request executeWithResultBlock:^(VKResponse *response) {
        NSArray *items = response.json[@"items"];
        NSMutableArray *photos = [NSMutableArray array];
        
        for (NSDictionary *dictionary in items) {
            NSError *error;
            VKPPhotoModel *photo = [MTLJSONAdapter modelOfClass:[VKPPhotoModel class] fromJSONDictionary:dictionary error:&error];
            if (!error) {
                [photos addObject:photo];
            }
        }
        completion([photos copy], nil);
    } errorBlock:^(NSError *error) {
        completion(nil, error);
    }];
    
    return request;
}

@end
