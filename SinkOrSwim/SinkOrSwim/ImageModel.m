//
//  ImageModel.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "ImageModel.h"
#import "UIImage+animatedGIF.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize numImagesDisplayed = _numImagesDisplayed;

-(NSInteger) numImagesDisplayed {
    
    if(!_numImagesDisplayed){
        _numImagesDisplayed = 5;
    }
    
    return _numImagesDisplayed;
}

- (void)setNumImagesDisplayed:(NSInteger)numImagesDisplayed{
    _numImagesDisplayed = numImagesDisplayed;

}

-(NSArray*)imageNames {
    
    if(!_imageNames){
        _imageNames = @[@"Eric1", @"Eric2", @"eric3"];
    }
    
    return _imageNames;
}

- (void)setImageNames:(NSArray *)imageNames{
    _imageNames = imageNames;

    // do some more stuff
}

+(ImageModel*)sharedInstance {
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(UIImage*)getImageWithName:(NSString *)name{
    UIImage* image = nil;
    
//    NSURL *imageURL = [NSURL URLWithString:@"http://example.com/demo.jpg"];
//    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//    image = [UIImage imageWithData:imageData];
    
    
    image = [UIImage imageNamed:name];
    
    return image;
}

-(UIImage*)getGIFWithName:(NSString *)name{
    UIImage* image = nil;
    
    //    NSURL *imageURL = [NSURL URLWithString:@"http://example.com/demo.jpg"];
    //    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    //    image = [UIImage imageWithData:imageData];
    
    
    image = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:@"https://i.imgur.com/3KdNzKU.gif"]];
    
    return image;
}

@end
