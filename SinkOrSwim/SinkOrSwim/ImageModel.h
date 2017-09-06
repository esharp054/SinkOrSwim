//
//  ImageModel.h
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageModel : NSObject

@property(strong, nonatomic) NSArray * imageNames;
@property(strong, nonatomic) NSDictionary * imgurPull;
@property(strong, nonatomic) NSArray * data;


+(ImageModel*) sharedInstance;

-(UIImage*)getImageWithName:(NSString *)name;

-(UIImage*)getGIFWithName:(NSString *)name;

@end
