//
//  VKPAlbumPhotoCollectionViewCell.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPAlbumPhotosCollectionViewCell.h"
#import "VKPPhotoModel.h"

#import "UIImageView+WebCache.h"
#import "UIView+WebCache.h"

@implementation VKPAlbumPhotosCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareForReuse {
    self.thumbImageView.image = nil;
}


- (void)fillCellWithModel:(VKPPhotoModel *)model {
    [self.thumbImageView sd_setShowActivityIndicatorView:YES];
    [self.thumbImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.thumbImageView sd_setImageWithURL:model.thumbPhotoUrl];
}

@end
