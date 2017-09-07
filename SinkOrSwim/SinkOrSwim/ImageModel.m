//
//  ImageModel.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "ImageModel.h"
#import "UIImage+animatedGIF.h"

@interface ImageModel()

@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize numImagesDisplayed = _numImagesDisplayed;
@synthesize albums = _albums;

-(NSArray*) sortAlbumsForGIF {
    NSLog(@"Sorting for gifs");
    NSArray* final = nil;
    NSMutableArray* gifs = [[NSMutableArray alloc] init];
    for(NSString *key in self.albums) {
        NSArray* temp = [[_albums objectForKey:key] mutableCopy];
        for(NSInteger i = 0; i < temp.count; i ++){
            if ([[temp[i] pathExtension] isEqualToString:@"gif"]){
                NSLog(@"%@", temp[i]);
                [gifs addObject:temp[i]];
            }
        }
    }
    
    final = [gifs mutableCopy];
    return final;
}

-(NSArray*) sortAlbumsForImages {
    NSLog(@"Sorting for images");
    NSArray* final = nil;
    NSMutableArray* images = [[NSMutableArray alloc] init];
    for(NSString *key in self.albums) {
        NSArray* temp = [[_albums objectForKey:key] mutableCopy];
        for(NSInteger i = 0; i < temp.count; i ++){
            if (![[temp[i] pathExtension] isEqualToString:@"gif"]){
                [images addObject:temp[i]];
            }
        }
    }
    
    final = [images mutableCopy];
    NSLog(@"%@", final);
    return final;
}

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
        _imageNames = [self sortAlbumsForImages];
    }
    
    return _imageNames;
}

-(NSMutableDictionary*)albums {
    
    if(!_albums){
        _albums = [[NSMutableDictionary alloc]init];
    }
    
    return _albums;
}

-(NSArray*)GIFLinks {
    
    if(!_GIFLinks){
        _GIFLinks = [self sortAlbumsForGIF];
    }
    
    return _GIFLinks;
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

-(UIImage*)getImageWithIndex:(NSInteger)index{
    UIImage* image = nil;
    
    NSURL *imageURL = [NSURL URLWithString:self.imageNames[index]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    image = [UIImage imageWithData:imageData];
    
    
//    image = [UIImage imageNamed:name];
    
    return image;
}

//-(UIImage*)getGIFWithName:(NSString *)name{
//    UIImage* image = nil;
//    
//    //    NSURL *imageURL = [NSURL URLWithString:@"http://example.com/demo.jpg"];
//    //    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//    //    image = [UIImage imageWithData:imageData];
//
//    
//    image = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:self.GIFLinks[0]]];
//    
//    return image;
//}

-(UIImage*)getGIFWithIndex:(NSInteger)index{
    UIImage* image = nil;
    
    //    NSURL *imageURL = [NSURL URLWithString:@"http://example.com/demo.jpg"];
    //    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    //    image = [UIImage imageWithData:imageData];
    
    
    image = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:self.GIFLinks[index]]];
    
    return image;
}

@end
