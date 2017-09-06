//
//  ImageModel.m
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;
//@synthesize imgurPull = _imgurPull;

-(NSArray*)imageNames {
    
    if(!_imageNames){
        _imageNames = @[@"Eric1", @"Eric2", @"eric3"];
    }
    
    return _imageNames;
}

//-(NSDictionary*)imgurPull {
//    
//    //Lazy Instantiation
//    if(!_imgurPull){
//        _imgurPull = @{};
//    }
//    
//    return _imgurPull;
//}
//
//- (void)setImgurPull:(NSDictionary *)imgurPull{
//    _imgurPull = imgurPull;
//    for(NSString *key in _imgurPull) {
//        NSLog(@"%@",[_imgurPull objectForKey:key]);
//    }
//    
//    // do some more stuff
//}

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

@end
