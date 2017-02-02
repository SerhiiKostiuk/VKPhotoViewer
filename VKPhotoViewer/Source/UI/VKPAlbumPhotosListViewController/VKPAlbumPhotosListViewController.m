//
//  VKPAlbumPhotosListViewController.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPAlbumPhotosListViewController.h"
#import "VKPAlbumPhotosListView.h"
#import "VKPAlbumPhotosCollectionViewCell.h"

#import "VKPAlbumModel.h"
#import "ApiManager.h"

#import "MBProgressHUD+KSExtensions.h"
#import "UIStoryboard+KSExtensions.h"
#import "UIAlertController+KSExtensions.h"
#import "KSMacro.h"

KSConstString(kKSAlbumPhotosCellIdentifier, @"VKPAlbumPhotosCollectionViewCell");

@interface VKPAlbumPhotosListViewController ()
@property (nonatomic, strong) VKPAlbumPhotosListView    *rootView;
@property (nonatomic, strong) VKPAlbumModel             *album;
@property (nonatomic, strong) NSArray                   *photos;


@end

@implementation VKPAlbumPhotosListViewController

#pragma mark -
#pragma mark Class Methods

+ (instancetype)controllerWithAlbum:(VKPAlbumModel *)album {
    UIStoryboard *storyboard = [UIStoryboard albumPhotosListStoryboard];
    NSString *identifier = NSStringFromClass([VKPAlbumPhotosListViewController class]);
    
    VKPAlbumPhotosListViewController *albumPhotosListViewController = nil;
    albumPhotosListViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    albumPhotosListViewController.album = album;
    
    return albumPhotosListViewController;
}

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rootView.photosCollectionView registerNib:[UINib nibWithNibName:kKSAlbumPhotosCellIdentifier bundle:nil] forCellWithReuseIdentifier:kKSAlbumPhotosCellIdentifier];
    
    [self updatePhotos];
}

#pragma mark -
#pragma mark Accessors

- (VKPAlbumPhotosListView *)rootView {
    return (VKPAlbumPhotosListView *)self.view;
}

-(void)setPhotos:(NSArray *)photos {
    if (_photos != photos) {
        _photos = photos;
        
        [self.rootView.photosCollectionView reloadData];
    }
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onBack:(id)sender {
}

#pragma mark -
#pragma mark Private

- (void)updatePhotos {
    [MBProgressHUD show];
    __weak typeof(self) weakSelf = self;
    
    ApiManager *sharedManager = [ApiManager sharedApiManager];
    
    [sharedManager getPhotosFromAlbum:self.album withCompletion:^(NSArray *photos, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        [MBProgressHUD hide];
        
        if (error) {
            [UIAlertController presentAlertControllerWithMessage:error.localizedDescription     inController:strongSelf];
        }
        strongSelf.photos = photos;
    }];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VKPAlbumPhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kKSAlbumPhotosCellIdentifier forIndexPath:indexPath];
    [cell fillCellWithModel:self.photos[indexPath.row]];
    
    return cell;
}


#pragma mark -
#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    PhotoViewerViewController *photoViewerController = [[PhotoViewerViewController alloc] initWithPhoto:self.photos[indexPath.row]];
//    [self.navigationController pushViewController:photoViewerController animated:YES];
}

@end
