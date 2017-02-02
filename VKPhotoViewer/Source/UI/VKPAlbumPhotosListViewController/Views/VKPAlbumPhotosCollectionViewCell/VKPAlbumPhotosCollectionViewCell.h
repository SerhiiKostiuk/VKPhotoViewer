//
//  VKPAlbumPhotosCollectionViewCell.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VKPPhotoModel;

@interface VKPAlbumPhotosCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *thumbImageView;

- (void)fillCellWithModel:(VKPPhotoModel *)model;


@end
