//
//  VKPPhotoDetailViewContoller.m
//  VKPhotoViewer
//
//  Created by Сергій Костюк on 02.02.17.
//  Copyright © 2017 Сергій Костюк. All rights reserved.
//

#import "VKPPhotoDetailViewContoller.h"
#import "VKPPhotoDetailView.h"
#import "VKPPhotoModel.h"
#import "UIStoryboard+KSExtensions.h"
#import "VKPPhotoDetailViewContollerDelegate.h"

@interface VKPPhotoDetailViewContoller ()
@property (nonatomic, strong) VKPPhotoDetailView    *rootView;
@property (nonatomic, strong) VKPPhotoModel         *photo;

@end

@implementation VKPPhotoDetailViewContoller

#pragma mark -
#pragma mark Class Methods

+ (instancetype)controllerWithPhoto:(VKPPhotoModel *)photo {
    UIStoryboard *storyboard = [UIStoryboard photoDetailStoryboard];
    NSString *identifier = NSStringFromClass([VKPPhotoDetailViewContoller class]);
    
    VKPPhotoDetailViewContoller *photoDetailViewController = nil;
    photoDetailViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    photoDetailViewController.photo = photo;
    
    return photoDetailViewController;
}

#pragma mark -
#pragma mark View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rootView fillViewWithModel:self.photo];
}

#pragma mark -
#pragma mark Accessors

- (VKPPhotoDetailView *)rootView {
    return (VKPPhotoDetailView *)self.view;
}

- (IBAction)onBack:(id)sender {
    [self.delegate photoDetailViewCotrollerDidTapBack:self];
}

@end
