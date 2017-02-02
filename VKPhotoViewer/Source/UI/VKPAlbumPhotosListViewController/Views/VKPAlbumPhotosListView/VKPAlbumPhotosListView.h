//
//  VKPAlbumPhotosListView.h
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKPAlbumPhotosListView : UIView
@property (strong, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end
