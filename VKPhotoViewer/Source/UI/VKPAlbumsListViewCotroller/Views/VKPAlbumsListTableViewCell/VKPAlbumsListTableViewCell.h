//
//  VKPAlbumsListTableViewCell.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VKPAlbumModel;

@interface VKPAlbumsListTableViewCell : UITableViewCell

- (void)fillCellWithModel:(VKPAlbumModel *)model;

@end
