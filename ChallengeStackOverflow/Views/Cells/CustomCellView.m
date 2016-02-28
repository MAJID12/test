//
//  CustomCellView.m
//  ChallengeStackOverflow
//
//  Created by CHAIBI  on 28/02/2016.
//  Copyright (c) 2016 CHAIBI . All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "CustomCellView.h"

#import <SDWebImage/UIImageView+WebCache.h>

#pragma mark - Types

#pragma mark - Defines & Constants

#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface

@interface CustomCellView ()

#pragma mark - Private Properties
@property (nonatomic, weak)IBOutlet UILabel* titleLabel;
@property (nonatomic, weak)IBOutlet UIImageView* profileView;
@property (nonatomic, weak)IBOutlet UIProgressView* progress;

@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation CustomCellView

#pragma mark - Setup & Teardown


#pragma mark - Superclass Overrides

-(void)drawRect:(CGRect)rect
{
    
}

-(void)layoutSubviews
{
    
}

#pragma mark - Public methods
- (void)setupWithTitle:(NSString*)title imageUrl:(NSString*)imageUrl
{
    self.titleLabel.text = title;
    [self downloadAvatarImage:imageUrl];
}
#pragma mark - Private methods
- (void)downloadAvatarImage:(NSString*)imageUrl
{
    SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];

    UIImage *cachedImage =  [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:imageUrl];
    if (!cachedImage) {
        [downloader downloadImageWithURL:[NSURL URLWithString:imageUrl]
                                 options:0
                                progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                    self.progress.hidden = (receivedSize/expectedSize == 1);
                                    self.progress.progress = receivedSize/expectedSize;
                                }
                               completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                   self.progress.hidden = YES;
                                   if (image && finished) {
                                       // do something with image
                                       self.profileView.image = image;
                                       // cached image in memory
                                       [[SDImageCache sharedImageCache] storeImage:image forKey:imageUrl];
                                   }
                               }];
    }else
    {
        self.profileView.image = cachedImage;
    }
}

#pragma mark - XXXDataSource / XXXDelegate methods

@end
