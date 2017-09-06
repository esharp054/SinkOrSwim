//
//  ImageModel.h
//  SinkOrSwim
//
//  Created by Elena Sharp on 9/4/17.
//  Copyright © 2017 Elena Sharp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject

@property(strong, nonatomic) NSArray * imageNames; 

+(ImageModel*) sharedInstance;

@end
