//
//  VKPPhotoDetailView.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPPhotoDetailView.h"
#import "VKPPhotoModel.h"

#import "UIImageView+WebCache.h"
#import "UIView+WebCache.h"

@implementation VKPPhotoDetailView

- (void)fillViewWithModel:(VKPPhotoModel *)model {
    [self.photoDetailImageView sd_setShowActivityIndicatorView:YES];
    [self.photoDetailImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.photoDetailImageView sd_setImageWithURL:model.fullPhotoUrl];
}

@end
