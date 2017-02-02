//
//  VKPAlbumsListViewCotroller.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 01.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPAlbumsListViewCotroller.h"
#import "VKPAlbumsListView.h"
#import "VKPAlbumsListTableViewCell.h"

#import "VKPAlbumsListViewCotrollerDelegate.h"

#import "ApiManager.h"

#import "MBProgressHUD+KSExtensions.h"
#import "UIAlertController+KSExtensions.h"

#import "KSMacro.h"

KSConstString(kKSAlbumCellIdentifier, @"VKPAlbumsListTableViewCell");

@interface VKPAlbumsListViewCotroller () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) VKPAlbumsListView *rootView;
@property (nonatomic, strong) NSArray *albums;

@end

@implementation VKPAlbumsListViewCotroller

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.rootView.albumsListTableView registerNib:[UINib nibWithNibName:kKSAlbumCellIdentifier bundle:nil] forCellReuseIdentifier:kKSAlbumCellIdentifier];
    [self updateAlbums];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark Accessors

- (VKPAlbumsListView *)rootView {
    return (VKPAlbumsListView *)self.view;
}

- (void)setAlbums:(NSArray *)albums {
    if (_albums != albums) {
        _albums = albums;
        [self.rootView.albumsListTableView reloadData];
    }
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onLogout:(id)sender {
    [self.delegate albumsListViewCotrollerDidTapLogout:self];
}

#pragma mark -
#pragma mark Private Albums Update

- (void)updateAlbums {
    [MBProgressHUD show];
    __weak typeof(self) weakSelf = self;

    ApiManager *sharedManager = [ApiManager sharedApiManager];
    [sharedManager getAlbumsWithCompletion:^(NSArray *albums, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;

        [MBProgressHUD hide];
        
        if (error) {
            [UIAlertController presentAlertControllerWithMessage:error.localizedDescription     inController:strongSelf];
        }
        strongSelf.albums = albums;
    }];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VKPAlbumsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kKSAlbumCellIdentifier];
    [cell fillCellWithModel:self.albums[indexPath.item]];

    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate albumsListViewCotroller:self didSelectAlbum:self.albums[indexPath.item]];
}

@end
