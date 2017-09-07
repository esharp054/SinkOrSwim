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
@synthesize imgurPull = _imgurPull;
@synthesize data = _data;

-(NSArray*)imageNames {
    
    if(!_imageNames){
        _imageNames = @[@"Eric1", @"Eric2", @"eric3"];
    }
    
    return _imageNames;
}

-(NSArray*)data {
    
    if(!_data){
        _data = [self.imgurPull objectForKey:@"data"];
    }
    
    return _data;
}

- (void)setImageNames:(NSArray *)imageNames{
    imageNames = imageNames;

    // do some more stuff
}

-(NSDictionary*)imgurPull {
    
    //Lazy Instantiation
    if(!_imgurPull){
        _imgurPull = @{};
    }
    
    return _imgurPull;
}

- (void)setImgurPull:(NSDictionary *)imgurPull{
    _imgurPull = imgurPull;
//    for(NSString *key in _imgurPull) {
//        NSLog(@"%@",key);
////        NSLog(@"%@",[_imgurPull objectForKey:key]);
//    }
    
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
    
    
    image = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:@"https://media.giphy.com/media/3otPoRryBOP1km7xW8/giphy.gif"]];
    
    return image;
}

@end
