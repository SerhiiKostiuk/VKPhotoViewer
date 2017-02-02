//
//  VKPAlbumsListTableViewCell.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPAlbumsListTableViewCell.h"
#import "VKPAlbumModel.h"

#import "UIImageView+WebCache.h"
#import "UIView+WebCache.h"

@interface VKPAlbumsListTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (strong, nonatomic) IBOutlet UILabel *albumTitleLabel;

@end

@implementation VKPAlbumsListTableViewCell

- (void)prepareForReuse {
    self.thumbImageView = nil;
    self.albumTitleLabel = nil;
}

- (void)fillCellWithModel:(VKPAlbumModel *)model {
    self.albumTitleLabel.text = model.title;
    
    [self.thumbImageView sd_setShowActivityIndicatorView:YES];
    [self.thumbImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];

    [self.thumbImageView sd_setImageWithURL:model.thumbUrl];
}

@end
